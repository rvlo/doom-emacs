;;; module-lua.el --- lua + Love2D

(use-package lua-mode
  :mode "\\.lua$"
  :interpreter "lua"
  :init
  (define-repl! lua-mode narf-inf-lua)
  (add-hook! lua-mode 'flycheck-mode)
  ;; (after! company-dict
  ;;   (add-to-list 'company-dict-minor-mode-alist 'love-mode))

  (defun narf-inf-lua ()
    (lua-start-process "lua" "lua")
    (pop-to-buffer lua-process-buffer)))

(define-minor-mode love-mode
  "Buffer local minor mode for Love2D"
  :init-value nil
  :lighter " ♥"
  :keymap (make-sparse-keymap)
  (add-yas-minor-mode! 'love-mode))
(associate! love-mode :files ("main.lua" "conf.lua"))
(define-builder! love-mode "open -a love.app '%s'" "main.lua")

(define-minor-mode hammerspoon-mode
  :init-value nil
  :lighter " hammer"
  :keymap (let ((map ))
            (map! :map map
                  (:localleader
                    :n "b" (λ! (shell-command (format "open hammerspoon://reload")))))
            map)
  (add-yas-minor-mode! 'hammerspoon-mode))
(associate! hammerspoon-mode :match "/\\.?hammerspoon/.+\\.lua$")

(provide 'module-lua)
;;; module-lua.el ends here
