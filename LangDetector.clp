

(deftemplate LangType (slot isCompiled))
(deftemplate LangYear (slot isNew))
(deftemplate LangSType (slot isStrongType))
(deftemplate LangFEWeb (slot canUseInFrontEnd))



(defrule Add_LangType
=>
(printout t "Is Compiled lang ? (y|n): " crlf)
(bind ?type (read))
(assert (LangType (isCompiled ?type))))


(defrule Add_LangSType
     (LangType (isCompiled y))
    =>
    (printout t "Is Strong Type ? (y|n): " crlf)
    (bind ?type (read))
(assert (LangSType (isStrongType ?type))))


(defrule Add_LangFEWeb
    (LangType (isCompiled n))
    =>
    (printout t "Can Use It In FrontEnd ? (y|n): " crlf)
    (bind ?type (read))
(assert (LangFEWeb (canUseInFrontEnd ?type))))


(defrule Add_NewLang
    (LangSType (isStrongType y))
    =>
    (printout t "Is New Lang ? (y|n): " crlf)
    (bind ?type (read))
(assert (LangYear (isNew ?type))))
            


(defrule ANS1
    (LangType (isCompiled y))
    (LangSType (isStrongType y))
    (LangYear (isNew y))
    =>
(printout t "Your Programming Lang Is Maybe Go or kotiln!!" crlf))


(defrule ANS2
    (LangType (isCompiled y))
    (LangSType (isStrongType y))
    (LangYear (isNew n))
    =>
(printout t "Your Programming Lang Is Maybe Java!!" crlf))

(defrule ANS3
    (LangType (isCompiled n))
    (LangFEWeb (canUseInFrontEnd y))
    =>
(printout t "Your Programming Lang Is Maybe JS!!" crlf))

(defrule ANS4
    (LangType (isCompiled n))
    (LangFEWeb (canUseInFrontEnd n))
    =>
(printout t "Your Programming Lang Is Maybe Php or Python!!" crlf))

(defrule ANS5
    (LangType (isCompiled y))
    (LangSType (isStrongType n))
    =>
(printout t "Your Programming Lang Is Maybe C or C++!!" crlf))


