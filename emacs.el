(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(require 'auto-complete)
(global-auto-complete-mode t)
(electric-pair-mode t)
(show-paren-mode t)
(require 'auto-indent-mode)
(auto-indent-global-mode)
(add-hook 'python-mode-hook '(lambda ()
                               (setq python-indent 4)))


(setq c-default-style "linux")

(add-hook 'c-mode-common-hook '(lambda ()
                                 (setq c-indent-level 4
                                       c-basic-offset 4
                                       indent-tabs-mode nil)))

(require 'sr-speedbar)
(custom-set-variables
 ;; custom-set-variables was added by Custom.                                                        
 ;; If you edit it by hand, you could mess it up, so be careful.                                     
 ;; Your init file should contain only one such instance.                                            
 ;; If there is more than one, they won't work right.                                                
 '(haskell-mode-hook (quote (turn-on-haskell-indent)))
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.                                                            
 ;; If you edit it by hand, you could mess it up, so be careful.                                     
 ;; Your init file should contain only one such instance.                                            
 ;; If there is more than one, they won't work right.                                                
 )
