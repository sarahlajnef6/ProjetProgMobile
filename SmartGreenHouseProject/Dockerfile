
FROM smart-greenhouse:latest AS builder

FROM scratch

COPY --from=builder /app/build/app/outputs/flutter-apk/app-release.apk /app-release.apk
