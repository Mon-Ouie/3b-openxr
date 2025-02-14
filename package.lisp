(defpackage #:3b-openxr-mid-level
  ;; mid-level utilities to make writing high-level wrappers
  ;; easier. mostly generated macros for dealing with foreign structs
  (:use :cl)
  (:local-nicknames (#:a #:alexandria-2)
                    (#:% #:3b-openxr-bindings))
  (:export #:with-vector-2f
           #:with-vector-3f
           #:with-vector-4f
           #:with-color-4f
           #:with-quaternion-f
           #:with-pose-f
           #:with-offset-2d-f
           #:with-extent-2d-f
           #:with-rect-2d-f
           #:with-offset-2d-i
           #:with-extent-2d-i
           #:with-rect-2d-i
           #:with-api-layer-properties
           #:with-extension-properties
           #:with-application-info
           #:with-instance-create-info
           #:with-instance-properties
           #:with-system-get-info
           #:with-system-properties
           #:with-system-graphics-properties
           #:with-system-tracking-properties
           #:with-graphics-binding-opengl-win-32-khr
           #:with-graphics-binding-opengl-xlib-khr
           #:with-graphics-binding-opengl-xcb-khr
           #:with-graphics-binding-opengl-wayland-khr
           #:with-graphics-binding-d3d11-khr
           #:with-graphics-binding-d3d12-khr
           #:with-graphics-binding-opengl-esandroid-khr
           #:with-graphics-binding-vulkan-khr
           #:with-session-create-info
           #:with-session-begin-info
           #:with-swapchain-create-info
           #:with-swapchain-image-opengl-khr
           #:with-swapchain-image-opengl-es-khr
           #:with-swapchain-image-vulkan-khr
           #:with-swapchain-image-d3d11-khr
           #:with-swapchain-image-d3d12-khr
           #:with-swapchain-image-acquire-info
           #:with-swapchain-image-wait-info
           #:with-swapchain-image-release-info
           #:with-reference-space-create-info
           #:with-action-space-create-info
           #:with-space-location
           #:with-space-velocity
           #:with-fov-f
           #:with-view
           #:with-view-locate-info
           #:with-view-state
           #:with-view-configuration-view
           #:with-swapchain-sub-image
           #:with-composition-layer-projection-view
           #:with-composition-layer-projection
           #:with-composition-layer-quad
           #:with-composition-layer-cylinder-khr
           #:with-composition-layer-cube-khr
           #:with-composition-layer-equirect-khr
           #:with-composition-layer-depth-info-khr
           #:with-frame-begin-info
           #:with-frame-end-info
           #:with-frame-wait-info
           #:with-frame-state
           #:with-haptic-vibration
           #:with-event-data-buffer
           #:with-event-data-events-lost
           #:with-event-data-instance-loss-pending
           #:with-event-data-session-state-changed
           #:with-event-data-reference-space-change-pending
           #:with-event-data-perf-settings-ext
           #:with-event-data-visibility-mask-changed-khr
           #:with-view-configuration-properties
           #:with-action-state-boolean
           #:with-action-state-float
           #:with-action-state-vector-2f
           #:with-action-state-pose
           #:with-action-state-get-info
           #:with-haptic-action-info
           #:with-action-set-create-info
           #:with-action-suggested-binding
           #:with-interaction-profile-suggested-binding
           #:with-active-action-set
           #:with-session-action-sets-attach-info
           #:with-actions-sync-info
           #:with-bound-sources-for-action-enumerate-info
           #:with-input-source-localized-name-get-info
           #:with-event-data-interaction-profile-changed
           #:with-interaction-profile-state
           #:with-action-create-info
           #:with-instance-create-info-android-khr
           #:with-vulkan-swapchain-format-list-create-info-khr
           #:with-debug-utils-object-name-info-ext
           #:with-debug-utils-label-ext
           #:with-debug-utils-messenger-callback-data-ext
           #:with-debug-utils-messenger-create-info-ext
           #:with-visibility-mask-khr
           #:with-graphics-requirements-opengl-khr
           #:with-graphics-requirements-opengl-es-khr
           #:with-graphics-requirements-vulkan-khr
           #:with-graphics-requirements-d3d11-khr
           #:with-graphics-requirements-d3d12-khr
           #:with-vulkan-instance-create-info-khr
           #:with-vulkan-device-create-info-khr
           #:with-vulkan-graphics-device-get-info-khr
           #:with-vulkan-swapchain-create-info-meta
           #:with-session-create-info-overlay-extx
           #:with-event-data-main-session-visibility-changed-extx
           #:with-event-data-display-refresh-rate-changed-fb
           #:with-view-configuration-depth-range-ext
           #:with-view-configuration-view-fov-epic
           #:with-interaction-profile-dpad-binding-ext
           #:with-interaction-profile-analog-threshold-valve
           #:with-binding-modifications-khr
           #:with-system-eye-gaze-interaction-properties-ext
           #:with-eye-gaze-sample-time-ext
           #:with-spatial-anchor-create-info-msft
           #:with-spatial-anchor-space-create-info-msft
           #:with-composition-layer-image-layout-fb
           #:with-composition-layer-alpha-blend-fb
           #:with-graphics-binding-eglmndx
           #:with-spatial-graph-node-space-create-info-msft
           #:with-spatial-graph-static-node-binding-create-info-msft
           #:with-spatial-graph-node-binding-properties-get-info-msft
           #:with-spatial-graph-node-binding-properties-msft
           #:with-system-hand-tracking-properties-ext
           #:with-hand-tracker-create-info-ext
           #:with-hand-joints-locate-info-ext
           #:with-hand-joint-location-ext
           #:with-hand-joint-velocity-ext
           #:with-hand-joint-locations-ext
           #:with-hand-joint-velocities-ext
           #:with-system-face-tracking-properties-fb
           #:with-face-tracker-create-info-fb
           #:with-face-expression-info-fb
           #:with-face-expression-status-fb
           #:with-face-expression-weights-fb
           #:with-system-body-tracking-properties-fb
           #:with-body-tracker-create-info-fb
           #:with-body-skeleton-joint-fb
           #:with-body-skeleton-fb
           #:with-body-joints-locate-info-fb
           #:with-body-joint-location-fb
           #:with-body-joint-locations-fb
           #:with-system-eye-tracking-properties-fb
           #:with-eye-tracker-create-info-fb
           #:with-eye-gazes-info-fb
           #:with-eye-gaze-fb
           #:with-eye-gazes-fb
           #:with-hand-joints-motion-range-info-ext
           #:with-hand-mesh-space-create-info-msft
           #:with-hand-mesh-update-info-msft
           #:with-hand-mesh-msft
           #:with-hand-mesh-index-buffer-msft
           #:with-hand-mesh-vertex-buffer-msft
           #:with-hand-mesh-vertex-msft
           #:with-system-hand-tracking-mesh-properties-msft
           #:with-hand-pose-type-info-msft
           #:with-secondary-view-configuration-session-begin-info-msft
           #:with-secondary-view-configuration-state-msft
           #:with-secondary-view-configuration-frame-state-msft
           #:with-secondary-view-configuration-frame-end-info-msft
           #:with-secondary-view-configuration-layer-info-msft
           #:with-secondary-view-configuration-swapchain-create-info-msft
           #:with-holographic-window-attachment-msft
           #:with-android-surface-swapchain-create-info-fb
           #:with-swapchain-state-android-surface-dimensions-fb
           #:with-swapchain-state-sampler-opengl-es-fb
           #:with-swapchain-state-sampler-vulkan-fb
           #:with-composition-layer-secure-content-fb
           #:with-loader-init-info-android-khr
           #:with-composition-layer-equirect-2-khr
           #:with-composition-layer-color-scale-bias-khr
           #:with-controller-model-key-state-msft
           #:with-controller-model-node-properties-msft
           #:with-controller-model-properties-msft
           #:with-controller-model-node-state-msft
           #:with-controller-model-state-msft
           #:with-uuid-msft
           #:with-scene-observer-create-info-msft
           #:with-scene-create-info-msft
           #:with-new-scene-compute-info-msft
           #:with-visual-mesh-compute-lod-info-msft
           #:with-scene-sphere-bound-msft
           #:with-scene-oriented-box-bound-msft
           #:with-scene-frustum-bound-msft
           #:with-scene-bounds-msft
           #:with-scene-component-msft
           #:with-scene-components-msft
           #:with-scene-components-get-info-msft
           #:with-scene-component-location-msft
           #:with-scene-component-locations-msft
           #:with-scene-components-locate-info-msft
           #:with-scene-object-msft
           #:with-scene-objects-msft
           #:with-scene-component-parent-filter-info-msft
           #:with-scene-object-types-filter-info-msft
           #:with-scene-plane-msft
           #:with-scene-planes-msft
           #:with-scene-plane-alignment-filter-info-msft
           #:with-scene-mesh-msft
           #:with-scene-meshes-msft
           #:with-scene-mesh-buffers-get-info-msft
           #:with-scene-mesh-buffers-msft
           #:with-scene-mesh-vertex-buffer-msft
           #:with-scene-mesh-indices-uint-32-msft
           #:with-scene-mesh-indices-uint-16-msft
           #:with-serialized-scene-fragment-data-get-info-msft
           #:with-deserialize-scene-fragment-msft
           #:with-scene-deserialize-info-msft
           #:with-system-color-space-properties-fb
           #:with-system-spatial-entity-properties-fb
           #:with-spatial-anchor-create-info-fb
           #:with-space-component-status-set-info-fb
           #:with-space-component-status-fb
           #:with-event-data-spatial-anchor-create-complete-fb
           #:with-event-data-space-set-status-complete-fb
           #:with-foveation-profile-create-info-fb
           #:with-swapchain-create-info-foveation-fb
           #:with-swapchain-state-foveation-fb
           #:with-swapchain-image-foveation-vulkan-fb
           #:with-foveation-level-profile-create-info-fb
           #:with-foveation-eye-tracked-profile-create-info-meta
           #:with-foveation-eye-tracked-state-meta
           #:with-system-foveation-eye-tracked-properties-meta
           #:with-vector-4s-fb
           #:with-hand-tracking-mesh-fb
           #:with-hand-tracking-scale-fb
           #:with-hand-tracking-aim-state-fb
           #:with-hand-capsule-fb
           #:with-hand-tracking-capsules-state-fb
           #:with-render-model-path-info-fb
           #:with-render-model-properties-fb
           #:with-render-model-buffer-fb
           #:with-render-model-load-info-fb
           #:with-system-render-model-properties-fb
           #:with-render-model-capabilities-request-fb
           #:with-space-query-info-fb
           #:with-space-storage-location-filter-info-fb
           #:with-space-uuid-filter-info-fb
           #:with-space-component-filter-info-fb
           #:with-space-query-result-fb
           #:with-space-query-results-fb
           #:with-event-data-space-query-results-available-fb
           #:with-event-data-space-query-complete-fb
           #:with-space-save-info-fb
           #:with-space-erase-info-fb
           #:with-event-data-space-save-complete-fb
           #:with-event-data-space-erase-complete-fb
           #:with-space-share-info-fb
           #:with-event-data-space-share-complete-fb
           #:with-space-list-save-info-fb
           #:with-event-data-space-list-save-complete-fb
           #:with-space-container-fb
           #:with-extent-3df-fb
           #:with-offset-3df-fb
           #:with-rect-3df-fb
           #:with-semantic-labels-fb
           #:with-room-layout-fb
           #:with-boundary-2d-fb
           #:with-scene-capture-request-info-fb
           #:with-event-data-scene-capture-complete-fb
           #:with-system-keyboard-tracking-properties-fb
           #:with-keyboard-tracking-description-fb
           #:with-keyboard-space-create-info-fb
           #:with-keyboard-tracking-query-fb
           #:with-composition-layer-depth-test-varjo
           #:with-view-locate-foveated-rendering-varjo
           #:with-foveated-view-configuration-view-varjo
           #:with-system-foveated-rendering-properties-varjo
           #:with-composition-layer-reprojection-info-msft
           #:with-composition-layer-reprojection-plane-override-msft
           #:with-triangle-mesh-create-info-fb
           #:with-system-passthrough-properties-fb
           #:with-system-passthrough-properties-2-fb
           #:with-passthrough-create-info-fb
           #:with-passthrough-layer-create-info-fb
           #:with-composition-layer-passthrough-fb
           #:with-geometry-instance-create-info-fb
           #:with-geometry-instance-transform-fb
           #:with-passthrough-style-fb
           #:with-passthrough-color-map-mono-to-rgba-fb
           #:with-passthrough-color-map-mono-to-mono-fb
           #:with-passthrough-brightness-contrast-saturation-fb
           #:with-event-data-passthrough-state-changed-fb
           #:with-passthrough-keyboard-hands-intensity-fb
           #:with-local-dimming-frame-end-info-meta
           #:with-spatial-anchor-persistence-name-msft
           #:with-spatial-anchor-persistence-info-msft
           #:with-spatial-anchor-from-persisted-anchor-create-info-msft
           #:with-facial-tracker-create-info-htc
           #:with-system-facial-tracking-properties-htc
           #:with-facial-expressions-htc
           #:with-passthrough-create-info-htc
           #:with-passthrough-color-htc
           #:with-passthrough-mesh-transform-info-htc
           #:with-composition-layer-passthrough-htc
           #:with-vive-tracker-paths-htcx
           #:with-event-data-vive-tracker-connected-htcx
           #:with-composition-layer-space-warp-info-fb
           #:with-system-space-warp-properties-fb
           #:with-system-marker-tracking-properties-varjo
           #:with-event-data-marker-tracking-update-varjo
           #:with-marker-space-create-info-varjo
           #:with-uuid-ext
           #:with-global-dimmer-frame-end-info-ml
           #:with-digital-lens-control-almalence
           #:with-composition-layer-settings-fb
           #:with-external-camera-intrinsics-oculus
           #:with-external-camera-extrinsics-oculus
           #:with-external-camera-oculus
           #:with-performance-metrics-state-meta
           #:with-performance-metrics-counter-meta
           #:with-system-headset-id-properties-meta
           #:with-foveation-apply-info-htc
           #:with-foveation-configuration-htc
           #:with-foveation-dynamic-mode-info-htc
           #:with-foveation-custom-mode-info-htc
           #:with-active-action-set-priorities-ext
           #:with-active-action-set-priority-ext
           #:with-composition-layer-depth-test-fb
           #:with-coordinate-space-create-info-ml
           #:with-frame-end-info-ml
           #:with-haptic-amplitude-envelope-vibration-fb
           #:with-haptic-pcm-vibration-fb
           #:with-device-pcm-sample-rate-state-fb
           #:with-space-user-create-info-fb
           #:with-system-force-feedback-curl-properties-mndx
           #:with-force-feedback-curl-apply-locations-mndx
           #:with-force-feedback-curl-apply-location-mndx))

(defpackage #:3b-openxr-wrappers
  ;; implementation package for high-level wrappers, public API is in
  ;; 3B-OPENXR package
  (:use :cl #:3b-openxr-mid-level)
  (:local-nicknames (#:a #:alexandria-2)
                    (#:% #:3b-openxr-bindings)
                    (#:m #:3b-openxr-mid-level))
  (:import-from #:3b-openxr-bindings
                #:+null-handle+
                #:+null-path+
                #:+null-system-id+
;                #:width
;                #:height
                #:pose
                #:*instance*)
  (:export #:seconds-to-time
           #:time-to-seconds
           #:with-instance
           #:with-debug-messsenger
           #:with-session
           #:with-reference-space
           #:enumerate-api-layer-properties
           #:enumerate-instance-extension-properties
           #:create-instance
           #:create-debug-utils-messenger-ext
           #:get-system
           #:enumerate-environment-blend-modes
           #:get-opengl-graphics-requirements-khr
           #:create-session
           #:destroy-session
           #:enumerate-reference-spaces
           #:create-reference-space
           #:enumerate-view-configuration-views
           #:enumerate-swapchain-images/gl
           #:enumerate-swapchain-images/vulkan
           #:enumerate-swapchain-formats
           #:create-action-set
           #:create-action
           #:string-to-path
           #:suggest-interaction-profile-bindings
           #:attach-session-action-sets
           #:sync-actions
           #:get-action-state-boolean
           #:apply-haptic-feedback
           #:begin-session
           #:wait-frame
           #:begin-frame
           #:end-frame
           #:with-frame
           #:acquire-swapchain-image
           #:wait-swapchain-image
           #:release-swapchain-image
           #:with-swapchain-image/1
           #:projection-view
           #:make-projection-view
           #:projection-view-p
           #:copy-projection-view
           #:projection-view-position
           #:projection-view-orientation
           #:projection-view-position-tracked
           #:projection-view-orientation-tracked
           #:projection-view-fov
           #:projection-view-index
           #:projection-view-swapchain
           #:projection-view-image-top
           #:projection-view-image-bottom
           #:projection-view-image-left
           #:projection-view-image-right
           #:projection-view-image
           #:locate-views
           #:check-result
           #:poll-event-case
           #:fov-p
           #:angle-left
           #:angle-right
           #:angle-up
           #:angle-down
           #:debug-messenger-callback
           #:destroy-instance
           #:get-instance-properties
           #:result-to-string
           #:structure-type-to-string
           #:+null-handle+
           #:+null-path+
           #:+null-system-id+
           #:get-system-properties
           #:get-system-hand-tracking-properties-ext
           #:get-system-eye-gaze-interaction-properties-ext
           #:get-system-face-tracking-properties-fb
           #:get-system-body-tracking-properties-fb
           #:get-system-eye-tracking-properties-fb
           #:get-system-hand-tracking-mesh-properties-msft
           #:get-system-color-space-properties-fb
           #:get-system-spatial-entity-properties-fb
           #:get-system-foveation-eye-tracked-properties-meta
           #:get-system-render-model-properties-fb
           #:get-system-keyboard-tracking-properties-fb
           #:get-system-foveated-rendering-properties-varjo
           #:get-system-passthrough-properties-fb
           #:get-system-passthrough-properties-2-fb
           #:get-system-facial-tracking-properties-htc
           #:get-system-space-warp-properties-fb
           #:get-system-marker-tracking-properties-varjo
           #:get-system-headset-id-properties-meta
           #:get-system-force-feedback-curl-properties-mndx
           #:path-to-string
           #:get-reference-space-bounds-rect
           #:width
           #:height
           #:create-action-space
           #:destroy-space
           #:locate-space
           #:pose
           #:make-pose
           #:pose-p
           #:copy-pose
           #:pose-orientation
           #:pose-position
           #:pose-orientation-tracked
           #:pose-position-tracked
           #:pose+velocity
           #:make-pose+velocity
           #:pose+velocity-p
           #:copy-pose+velocity
           #:pose+velocity-orientation
           #:pose+velocity-position
           #:pose+velocity-orientation-tracked
           #:pose+velocity-position-tracked
           #:pose+velocity-velocity
           #:pose+velocity-angular-velocity
           #:x
           #:y
           #:z
           #:w
           #:r
           #:g
           #:b
           #:a
           #:v2f
           #:v3f
           #:v4f
           #:enumerate-view-configurations
           #:get-view-configuration-properties
           #:end-session
           #:request-exit-session
           #:create-swapchain
           #:create-swapchain/gl
           #:destroy-swapchain
           #:destroy-action-set
           #:destroy-action
           #:get-current-interaction-profile
           #:get-action-state-float
           #:enumerate-bound-sources-for-action
           #:stop-haptic-feedback
           #:get-input-source-localized-name
           #:convert-win32-performance-counter-to-time-khr
           #:convert-time-to-win32-performance-counter-khr
           #:set-debug-utils-object-name-ext
           #:submit-debug-utils-message-ext
           #:session-begin-debug-utils-label-region-ext
           #:session-insert-debug-utils-label-ext
           #:session-end-debug-utils-label-region-ext
           #:create-hand-tracker-ext
           #:destroy-hand-tracker-ext
           #:locate-hand-joints-ext
           #:enumerate-display-refresh-rates-fb
           #:get-display-refresh-rate-fb
           #:request-display-refresh-rate-fb
           #:failed
           #:succeeded
           #:unqualified-success
           #:qualified-success
           #:with-debug-utils-label
           #:extension-present-p
           #:extension-available-p
           #:layer-available-p
           #:error-validation-failure
           #:error-runtime-failure
           #:error-out-of-memory
           #:error-api-version-unsupported
           #:error-initialization-failed
           #:error-function-unsupported
           #:error-feature-unsupported
           #:error-extension-not-present
           #:error-limit-reached
           #:error-size-insufficient
           #:error-handle-invalid
           #:error-instance-lost
           #:error-session-running
           #:error-session-not-running
           #:error-session-lost
           #:error-system-invalid
           #:error-path-invalid
           #:error-path-count-exceeded
           #:error-path-format-invalid
           #:error-path-unsupported
           #:error-layer-invalid
           #:error-layer-limit-exceeded
           #:error-swapchain-rect-invalid
           #:error-swapchain-format-unsupported
           #:error-action-type-mismatch
           #:error-session-not-ready
           #:error-session-not-stopping
           #:error-time-invalid
           #:error-reference-space-unsupported
           #:error-file-access-error
           #:error-file-contents-invalid
           #:error-form-factor-unsupported
           #:error-form-factor-unavailable
           #:error-api-layer-not-present
           #:error-call-order-invalid
           #:error-graphics-device-invalid
           #:error-pose-invalid
           #:error-index-out-of-range
           #:error-view-configuration-type-unsupported
           #:error-environment-blend-mode-unsupported
           #:error-name-duplicated
           #:error-name-invalid
           #:error-actionset-not-attached
           #:error-actionsets-already-attached
           #:error-localized-name-duplicated
           #:error-localized-name-invalid
           #:error-graphics-requirements-call-missing
           #:error-runtime-unavailable
           #:error-android-thread-settings-id-invalid-khr
           #:error-android-thread-settings-failure-khr
           #:error-create-spatial-anchor-failed-msft
           #:error-secondary-view-configuration-type-not-enabled-msft
           #:error-controller-model-key-invalid-msft
           #:error-reprojection-mode-unsupported-msft
           #:error-compute-new-scene-not-completed-msft
           #:error-scene-component-id-invalid-msft
           #:error-scene-component-type-mismatch-msft
           #:error-scene-mesh-buffer-id-invalid-msft
           #:error-scene-compute-feature-incompatible-msft
           #:error-scene-compute-consistency-mismatch-msft
           #:error-display-refresh-rate-unsupported-fb
           #:error-color-space-unsupported-fb
           #:error-space-component-not-supported-fb
           #:error-space-component-not-enabled-fb
           #:error-space-component-status-pending-fb
           #:error-space-component-status-already-set-fb
           #:error-unexpected-state-passthrough-fb
           #:error-feature-already-created-passthrough-fb
           #:error-feature-required-passthrough-fb
           #:error-not-permitted-passthrough-fb
           #:error-insufficient-resources-passthrough-fb
           #:error-unknown-passthrough-fb
           #:error-render-model-key-invalid-fb
           #:error-marker-not-tracked-varjo
           #:error-marker-id-invalid-varjo
           #:error-spatial-anchor-name-not-found-msft
           #:error-spatial-anchor-name-invalid-msft
           #:error-space-mapping-insufficient-fb
           #:error-space-localization-failed-fb
           #:error-space-network-timeout-fb
           #:error-space-network-request-failed-fb
           #:error-space-cloud-storage-disabled-fb
           #:error-hint-already-set-qcom
           #:ignore-xr-error
           #:hand-tracker-handle
           #:hand-tracker-joint-count
           #:*check-verbose*
           #:swapchain
           #:swapchain-p
           #:swapchain-width
           #:swapchain-height
           #:swapchain-images
           #:destroy-debug-utils-messenger-ext
           #:get-action-state-vector-2f
           #:create-vulkan-device-khr
           #:get-vulkan-graphics-device-2-khr
           #:create-vulkan-instance-khr
           #:get-vulkan-graphics-requirements-2-khr))


(defpackage #:3b-openxr
  (:use #:3b-openxr-wrappers)
  ;; api package, exports symbols from binding and impl packages, so
  ;; it can shadow things useful for the impl package. Lots of symbols
  ;; (and lots that will conflict with other packages) so intended to
  ;; be used with package local nicknames rather than :USE.
  (:import-from #:3b-openxr-bindings
                #:+current-api-version+
                #:make-version
                #:parse-version
                #:version-major
                #:version-minor
                #:version-patch
                #:+null-handle+
                #:+null-path+
                #:+null-system-id+
                #:true
                #:false
                #:session
                #:state
                #:time
                #:loss-time
                #:lost-event-count
                #:reference-space-type
                #:change-time
                #:pose-valid
                #:pose-in-previous-space
                #:domain
                #:sub-domain
                #:from-level
                #:to-level
                #:view-configuration-type
                #:view-index
                #:from-display-refresh-rate
                #:to-display-refresh-rate
                #:visible
                #:flags
                #:marker-id
                #:is-active
                #:is-predicted
                #:request-id
                #:result
                #:space
                #:uuid
                #:location
                #:component-type
                #:enabled
                #:paths
;                #:end-session
;                #:width
;                #:height
                )
  (:export #:+current-api-version+
           #:make-version
           #:version-major
           #:version-minor
           #:version-patch
           #:+null-handle+
           #:+null-path+
           #:+null-system-id+
           #:+nanoseconds+
           #:seconds-to-time
           #:time-to-seconds
           #:r
           #:g
           #:b
           #:a
           #:rgab
           #:x
           #:y
           #:z
           #:w
           #:v2f
           #:v3f
           #:v4f
           #:quaternion
           #:pose
           #:make-pose
           #:pose-p
           #:copy-pose
           #:pose-orientation
           #:pose-position
           #:pose-orientation-tracked
           #:pose-position-tracked
           #:offset-2d-f
           #:offset-2d-i
           #:width
           #:height
           #:extent-2d-f
           #:extent-2d-i
           #:rect-2d-f
           #:make-rect-2d-f
           #:rect-2d-f-p
           #:copy-rect-2d-f
           #:rect-2d-f-offset
           #:rect-2d-f-extent
           #:rect-2d-i
           #:make-rect-2d-i
           #:rect-2d-i-p
           #:copy-rect-2d-i
           #:rect-2d-i-offset
           #:rect-2d-i-extent
           #:fov
           #:make-fov
           #:fov-p
           #:copy-fov
           #:angle-left
           #:angle-right
           #:angle-up
           #:angle-down
           #:true
           #:false
           #:poll-event-case
           #:session
           #:state
           #:time
           #:loss-time
           #:lost-event-count
           #:reference-space-type
           #:change-time
           #:pose-valid
           #:pose-in-previous-space
           #:domain
           #:sub-domain
           #:from-level
           #:to-level
           #:view-configuration-type
           #:view-index
           #:from-display-refresh-rate
           #:to-display-refresh-rate
           #:visible
           #:flags
           #:marker-id
           #:is-active
           #:is-predicted
           #:request-id
           #:result
           #:space
           #:uuid
           #:location
           #:component-type
           #:enabled
           #:paths
           #:with-instance
           #:with-debug-messsenger
           #:check-result
           #:enumerate-swapchain-images/gl
           #:enumerate-swapchain-images/vulkan
           #:create-action-set
           #:create-action
           #:string-to-path
           #:suggest-interaction-profile-bindings
           #:attach-session-action-sets
           #:sync-actions
           #:get-action-state-boolean
           #:apply-haptic-feedback
           #:begin-session
           #:end-session
           #:projection-view
           #:make-projection-view
           #:projection-view-p
           #:copy-projection-view
           #:projection-view-position
           #:projection-view-orientation
           #:projection-view-position-tracked
           #:projection-view-orientation-tracked
           #:projection-view-fov
           #:projection-view-index
           #:projection-view-swapchain
           #:projection-view-image-top
           #:projection-view-image-bottom
           #:projection-view-image-left
           #:projection-view-image-right
           #:projection-view-image
           #:wait-frame
           #:with-frame
           #:locate-views
           #:with-swapchain-image/1
           #:enumerate-instance-extension-properties
           #:enumerate-api-layer-properties
           #:get-system
           #:enumerate-environment-blend-modes
           #:get-opengl-graphics-requirements-khr
           #:with-session
           #:enumerate-reference-spaces
           #:with-reference-space
           #:enumerate-view-configuration-views
           #:enumerate-swapchain-formats
           #:destroy-instance
           #:get-instance-properties
           #:result-to-string
           #:structure-type-to-string
           #:get-system-properties
           #:get-system-hand-tracking-properties-ext
           #:get-system-eye-gaze-interaction-properties-ext
           #:get-system-face-tracking-properties-fb
           #:get-system-body-tracking-properties-fb
           #:get-system-eye-tracking-properties-fb
           #:get-system-hand-tracking-mesh-properties-msft
           #:get-system-color-space-properties-fb
           #:get-system-spatial-entity-properties-fb
           #:get-system-foveation-eye-tracked-properties-meta
           #:get-system-render-model-properties-fb
           #:get-system-keyboard-tracking-properties-fb
           #:get-system-foveated-rendering-properties-varjo
           #:get-system-passthrough-properties-fb
           #:get-system-passthrough-properties-2-fb
           #:get-system-facial-tracking-properties-htc
           #:get-system-space-warp-properties-fb
           #:get-system-marker-tracking-properties-varjo
           #:get-system-headset-id-properties-meta
           #:get-system-force-feedback-curl-properties-mndx
           #:path-to-string
           #:get-reference-space-bounds-rect
           #:create-action-space
           #:destroy-space
           #:locate-space
           #:pose+velocity-angular-velocity
           #:pose+velocity-velocity
           #:enumerate-view-configurations
           #:get-view-configuration-properties
           #:request-exit-session
           #:create-swapchain
           #:create-swapchain/gl
           #:destroy-swapchain
           #:destroy-action-set
           #:destroy-action
           #:get-current-interaction-profile
           #:get-action-state-float
           #:get-action-state-vector-2f
           #:enumerate-bound-sources-for-action
           #:stop-haptic-feedback
           #:get-input-source-localized-name
           #:convert-win32-performance-counter-to-time-khr
           #:convert-time-to-win32-performance-counter-khr
           #:set-debug-utils-object-name-ext
           #:submit-debug-utils-message-ext
           #:session-begin-debug-utils-label-region-ext
           #:session-insert-debug-utils-label-ext
           #:session-end-debug-utils-label-region-ext
           #:create-hand-tracker-ext
           #:destroy-hand-tracker-ext
           #:locate-hand-joints-ext
           #:enumerate-display-refresh-rates-fb
           #:get-display-refresh-rate-fb
           #:request-display-refresh-rate-fb
           #:with-debug-utils-label
           #:extension-available-p
           #:layer-available-p
           #:error-validation-failure
           #:error-runtime-failure
           #:error-out-of-memory
           #:error-api-version-unsupported
           #:error-initialization-failed
           #:error-function-unsupported
           #:error-feature-unsupported
           #:error-extension-not-present
           #:error-limit-reached
           #:error-size-insufficient
           #:error-handle-invalid
           #:error-instance-lost
           #:error-session-running
           #:error-session-not-running
           #:error-session-lost
           #:error-system-invalid
           #:error-path-invalid
           #:error-path-count-exceeded
           #:error-path-format-invalid
           #:error-path-unsupported
           #:error-layer-invalid
           #:error-layer-limit-exceeded
           #:error-swapchain-rect-invalid
           #:error-swapchain-format-unsupported
           #:error-action-type-mismatch
           #:error-session-not-ready
           #:error-session-not-stopping
           #:error-time-invalid
           #:error-reference-space-unsupported
           #:error-file-access-error
           #:error-file-contents-invalid
           #:error-form-factor-unsupported
           #:error-form-factor-unavailable
           #:error-api-layer-not-present
           #:error-call-order-invalid
           #:error-graphics-device-invalid
           #:error-pose-invalid
           #:error-index-out-of-range
           #:error-view-configuration-type-unsupported
           #:error-environment-blend-mode-unsupported
           #:error-name-duplicated
           #:error-name-invalid
           #:error-actionset-not-attached
           #:error-actionsets-already-attached
           #:error-localized-name-duplicated
           #:error-localized-name-invalid
           #:error-graphics-requirements-call-missing
           #:error-runtime-unavailable
           #:error-android-thread-settings-id-invalid-khr
           #:error-android-thread-settings-failure-khr
           #:error-create-spatial-anchor-failed-msft
           #:error-secondary-view-configuration-type-not-enabled-msft
           #:error-controller-model-key-invalid-msft
           #:error-reprojection-mode-unsupported-msft
           #:error-compute-new-scene-not-completed-msft
           #:error-scene-component-id-invalid-msft
           #:error-scene-component-type-mismatch-msft
           #:error-scene-mesh-buffer-id-invalid-msft
           #:error-scene-compute-feature-incompatible-msft
           #:error-scene-compute-consistency-mismatch-msft
           #:error-display-refresh-rate-unsupported-fb
           #:error-color-space-unsupported-fb
           #:error-space-component-not-supported-fb
           #:error-space-component-not-enabled-fb
           #:error-space-component-status-pending-fb
           #:error-space-component-status-already-set-fb
           #:error-unexpected-state-passthrough-fb
           #:error-feature-already-created-passthrough-fb
           #:error-feature-required-passthrough-fb
           #:error-not-permitted-passthrough-fb
           #:error-insufficient-resources-passthrough-fb
           #:error-unknown-passthrough-fb
           #:error-render-model-key-invalid-fb
           #:error-marker-not-tracked-varjo
           #:error-marker-id-invalid-varjo
           #:error-spatial-anchor-name-not-found-msft
           #:error-spatial-anchor-name-invalid-msft
           #:error-space-mapping-insufficient-fb
           #:error-space-localization-failed-fb
           #:error-space-network-timeout-fb
           #:error-space-network-request-failed-fb
           #:error-space-cloud-storage-disabled-fb
           #:error-hint-already-set-qcom
           #:ignore-xr-error
           #:create-session
           #:destroy-session
           #:hand-tracker-handle
           #:hand-tracker-joint-count
           #:*check-verbose*
           #:swapchain-width
           #:swapchain-height
           #:swapchain-images
           #:destroy-debug-utils-messenger-ext
           #:create-vulkan-device-khr
           #:get-vulkan-graphics-device-2-khr
           #:create-vulkan-instance-khr
           #:get-vulkan-graphics-requirements-2-khr))
