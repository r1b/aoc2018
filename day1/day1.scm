(module day1 (compute-freq parse-change)
  (import chicken.io matchable scheme)

  (define (parse-change line)
    (match line
      ((#\- freq ...) (- (string->number (list->string freq))))
      ((#\+ freq ...) (+ (string->number (list->string freq))))))

  (define (compute-freq freq)
    (let ((line (read-line)))
      (if (eof-object? line)
          freq
          (compute-freq (+ freq (parse-change (string->list line))))))))
