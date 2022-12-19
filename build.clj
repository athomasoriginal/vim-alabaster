#!/usr/bin/env bb

;; This script is used to quickly build a vim syntax file.  The key concepts:
;;
;; Specify a `color config file` in the same dir as you call this script from.
;; For example, `dark.edn`.
;;
;; usage:
;;   ./build.clj dark.edn
;;
;; concepts:
;;   * config           - map? top level keys include `:theme`, `:colors` and
;;                        `:highlights`.  `:highlights` can be either a keyword
;;                        referencing one of the keys in `:colors`.  Or it can
;;                        be a `highlight-config` map.  See below for the
;;                        definition of the `highlight-config`.
;;                        :theme
;;                          :output-dir - string? e.g. "./colors"
;;                          :output-to  - string? e.g. "alabaster-dark"
;;                          :type       - string? e.g. "dark", "light"
;;                          :name       - string? e.g. "alabaster-dark". Used
;;                                        as `output-to` file name unless
;;                                        `output-to` is already specified.
;;                        :highlights
;;                          "statusline" - this is special.  must be present
;;                                         and spelled correctly.
;;   * highlight-config - map? contains a description used to build a
;;                             `highlight-cmd`.  We transform the `highlights`
;;                             specified in the `edn` file into these.
;;                             Min example:
;;                               `{:color #789395}`
;;                             Max example:
;;                               `{:color   "#789395"
;;                                 :ctermfg "16"
;;                                 :guibg   "#f7f7f7"
;;                                 :ctermbg "231"
;;                                 :gui     "bold"
;;                                 :cterm   "bold"}`
;;                             Of the above, only `color`, `gui` and `bold`
;;                             are implemented.
;;   * highlight-cmd    - string? vim script for setting a highlight. Example:
;;                        hi title guifg=#ffff ctermfg=NONE etc
;;

(require '[clojure.edn    :as edn])

;; ----------------------------------------------------------------------------
;; Vim Script Setup
;;
;; hardcoded vim script helpers used for initializing a vim syntax file.
;; ----------------------------------------------------------------------------

(defn header
  [theme]
  (str
    "\" Vim syntax file\n"
    (str "\" Languages: " (:languages theme) "\n")
    (str "\" Maintainer: " (:maintainer theme) "\n")
    (str "\" Last Changed: " (:last-change theme) "\n")))

(defn set-background-color
  [background-type]
  (str "set background=" background-type "\n\n"))

(def clear-colors
  (str "hi clear\n\n"))

(def check-syntax-settings
  (str
    (str "if exists ('syntax_on')\n")
    (str "  syntax reset\n")
    (str "endif\n\n")))

(defn color-name-binding
  [theme-name]
  (str "let g:colors_name='" theme-name "'\n\n"))


(defn status-line-fn
  "Given a `insert-color`, `read-color` and `default-color` returns a string
  of vim script code.

  ## Args

  * mode - string? possible modes include:
                   `i` - color of the status line insert mode
                   `r` - color of the status line read mode"
  [insert-config read-config default-config]
  (str
    (str "function! InsertStatuslineColor(mode)\n")
    (str "  if a:mode == 'i'\n")
    (str "    hi statusline guibg='" (:color insert-config) "'\n")
    (str "  elseif a:mode == 'r'\n")
    (str "    hi statusline guibg='" (:color read-config) "'\n")
    (str "  else\n")
    (str "    hi statusline guibg='" (:color default-config) "'\n")
    (str "  endif\n")
    (str "endfunction\n\n")

    (str "au InsertEnter  * call InsertStatuslineColor(v:insertmode)\n")
    (str "au InsertChange * call InsertStatuslineColor(v:insertmode)\n")
    (str "au InsertLeave  * hi statusline guibg='" (:color default-config) "'\n\n")))

;; @todo remove extra space after
(defn highlight-arg
  [arg-name value]
  (if (= "cterm" arg-name)
    (str arg-name "=" value)
    (str arg-name "=" value " ")))


(defn rules
  [{:keys [background-type
           theme-name
           status-line-config]}]
  (str
    (set-background-color background-type)
    clear-colors
    check-syntax-settings
    (color-name-binding theme-name)
    (status-line-fn status-line-config status-line-config status-line-config)))


;; ----------------------------------------------------------------------------
;; Color Theme
;; ----------------------------------------------------------------------------

(defn config-file
  "Fetch the config file.  Looks for `dark.edn` by default."
  [config-file-name]
  (-> (slurp (or config-file-name "dark.edn"))
      edn/read-string))


(def highlight-arg-defaults
  {:color   "NONE"
   :ctermfg "NONE"
   :guibg   "NONE"
   :ctermbg "NONE"
   :gui     "NONE"
   :cterm   "NONE"})


(defn highlight-config
  "Given a map of `colors` and `highlight`, return a normalized
  `highlight-config` map."
  [colors highlights]
  (reduce-kv
    (fn [m k v]
      (let [next-value (if (map? v)
                         (merge
                           highlight-arg-defaults
                           {:color (get colors (:color v) (:color highlight-arg-defaults))
                            :guibg (get colors (:guibg v) (:guibg highlight-arg-defaults))
                            :gui   (or (:gui v) (:gui highlight-arg-defaults))
                            :cterm (or (:cterm v) (:cterm highlight-arg-defaults))})
                         (merge
                           highlight-arg-defaults
                           {:color (v colors)}))]
        (assoc m k next-value)))
    {}
    highlights))



(defn highlight-config->cmd
  "Given `group-name` and `value` returns a vim script `highlight command` as
  a string.

  ## Args

  * highlight-config - map?  he name of the Highlight Group."
  [group-name highlight-config]
  (reduce
    (fn [a [k v]]
      (str
        a
        (if (= :color k)
          (highlight-arg "guifg" (:color highlight-config))
          (highlight-arg (name k) v))))
    (str "hi " group-name " ")
    highlight-config))


(defn output-path
  "Defaults to `./colors/color.vim`"
  [{:keys [output-to output-dir]
    :or   {output-to "color" output-dir "./colors"}}]
  (let [output-to  (if (nil? output-to)
                     "color.vim"
                     (str output-to ".vim"))
        output-dir (if (nil? output-dir)
                     "./colors/"
                     (str output-dir "/"))]
    (str output-dir output-to)))


(defn write-syntax-file
  [config]
  (println "Config: " config)
  (let [theme-name        (-> config :theme :name)
        highlight-configs (highlight-config (:colors config) (:highlights config))
        highlight-cmds    (reduce
                            (fn [a [group-name config]]
                              (str a (highlight-config->cmd group-name config) "\n"))
                            ""
                            highlight-configs)]
    (spit
      (output-path
        {:output-dir (-> config :theme :output-dir)
         :output-to  (or (-> config :theme :output-to) theme-name)})

      (str (header (:theme config))

           (rules
             {:background-type    (-> config :theme :type)
              :theme-name         theme-name
              :status-line-config (get highlight-configs "statusline")})

           highlight-cmds))))


;; @todo add validation check that .edn file name provided.
;; @todo validate the shape of the config map: colors, theme, highlights
;; @note the keys of highlights are strings so that we can match `@` aspect
;; and can use key names without and transform step
(let [[config-file-name] *command-line-args*]
  (when (empty? config-file-name)
    (println "Usage: <config-file-name>.edn")
    (System/exit 1))
  (let [config            (config-file config-file-name)]
    (write-syntax-file config)))
