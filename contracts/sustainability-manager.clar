;; Sustainability Manager Verification Contract
;; Manages verification and authorization of sustainability managers

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_VERIFIED (err u101))
(define-constant ERR_NOT_FOUND (err u102))

;; Data structures
(define-map verified-managers principal bool)
(define-map manager-details
  principal
  {
    name: (string-ascii 50),
    organization: (string-ascii 100),
    certification: (string-ascii 50),
    verified-at: uint
  }
)

;; Verify a sustainability manager
(define-public (verify-manager (manager principal) (name (string-ascii 50)) (organization (string-ascii 100)) (certification (string-ascii 50)))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (asserts! (is-none (map-get? verified-managers manager)) ERR_ALREADY_VERIFIED)
    (map-set verified-managers manager true)
    (map-set manager-details manager {
      name: name,
      organization: organization,
      certification: certification,
      verified-at: block-height
    })
    (ok true)
  )
)

;; Check if manager is verified
(define-read-only (is-verified-manager (manager principal))
  (default-to false (map-get? verified-managers manager))
)

;; Get manager details
(define-read-only (get-manager-details (manager principal))
  (map-get? manager-details manager)
)

;; Revoke manager verification
(define-public (revoke-manager (manager principal))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (asserts! (is-some (map-get? verified-managers manager)) ERR_NOT_FOUND)
    (map-delete verified-managers manager)
    (map-delete manager-details manager)
    (ok true)
  )
)
