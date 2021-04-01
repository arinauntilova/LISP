(load "equation.lsp")

(defun myformat (x)
	(format nil "root: ~,5F" x) )