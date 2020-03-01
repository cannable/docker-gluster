docker run -d \
    --rm \
    --tmpfs /tmp \
    --tmpfs /run \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    --name gtest \
    cannable/gluster

