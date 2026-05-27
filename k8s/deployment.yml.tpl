apiVersion: apps/v1
kind: Deployment
metadata:
  name: plane-stream

spec:
  replicas: 1

  selector:
    matchLabels:
      app: plane-stream

  template:
    metadata:
      labels:
        app: plane-stream

    spec:
      volumes:
        - name: shared
          emptyDir: {}

      containers:
        - name: ffmpeg
          image: ghcr.io/deniskv/plane-ffmpeg:${TAG}

          volumeMounts:
            - name: shared
              mountPath: /shared

        - name: nginx
          image: ghcr.io/deniskv/plane-nginx:${TAG}

          ports:
            - containerPort: 80

          volumeMounts:
            - name: shared
              mountPath: /usr/share/nginx/html