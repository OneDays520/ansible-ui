<template>
  <v-chip v-if="status" style="font-weight: bold;" :color="getStatusColor(status)">
    <v-icon v-if="status !== 'running'" left>{{ getStatusIcon(status) }}</v-icon>
    <IndeterminateProgressCircular v-else style="margin-left: -5px;" />
    {{ humanizeStatus(status) }}
  </v-chip>
</template>
<script>
import IndeterminateProgressCircular from '@/components/IndeterminateProgressCircular.vue';

const TaskStatus = Object.freeze({
  WAITING: 'waiting',
  RUNNING: 'running',
  SUCCESS: 'success',
  ERROR: 'error',
  STOPPING: 'stopping',
  STOPPED: 'stopped',
});

export default {
  components: { IndeterminateProgressCircular },
  props: {
    status: String,
  },

  methods: {
    getStatusIcon(status) {
      switch (status) {
        case TaskStatus.WAITING:
          return 'mdi-alarm';
        case TaskStatus.RUNNING:
          return '';
        case TaskStatus.SUCCESS:
          return 'mdi-check-circle';
        case TaskStatus.ERROR:
          return 'mdi-information';
        case TaskStatus.STOPPING:
          return 'mdi-stop-circle';
        case TaskStatus.STOPPED:
          return 'mdi-stop-circle';
        default:
          throw new Error(`Unknown task status ${status}`);
      }
    },

    humanizeStatus(status) {
      switch (status) {
        case TaskStatus.WAITING:
          return '等待';
        case TaskStatus.RUNNING:
          return '运行';
        case TaskStatus.SUCCESS:
          return '成功';
        case TaskStatus.ERROR:
          return '失败';
        case TaskStatus.STOPPING:
          return '停止';
        case TaskStatus.STOPPED:
          return '已停';
        default:
          throw new Error(`Unknown task status ${status}`);
      }
    },

    getStatusColor(status) {
      switch (status) {
        case TaskStatus.WAITING:
          return '';
        case TaskStatus.RUNNING:
          return 'primary';
        case TaskStatus.SUCCESS:
          return 'success';
        case TaskStatus.ERROR:
          return 'error';
        case TaskStatus.STOPPING:
          return '';
        case TaskStatus.STOPPED:
          return '';
        default:
          throw new Error(`Unknown task status ${status}`);
      }
    },
  },
};
</script>
