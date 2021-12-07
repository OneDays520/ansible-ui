<template>
  <v-form
    ref="form"
    lazy-validation
    v-model="formValid"
    v-if="item != null"
  >
    <v-alert
      :value="formError"
      color="error"
      class="pb-2"
    >{{ formError }}</v-alert>

    <v-text-field
      v-model="item.name"
      label="项目名"
      :rules="[v => !!v || 'Project name is required']"
      required
      :disabled="formSaving"
    ></v-text-field>

    <v-checkbox
      v-model="item.alert"
      label="项目启用告警"
    ></v-checkbox>

    <v-text-field
      v-model="item.alert_chat"
      label="告警通信 ID"
      :disabled="formSaving"
    ></v-text-field>
  </v-form>
</template>
<script>
import ItemFormBase from '@/components/ItemFormBase';

export default {
  mixins: [ItemFormBase],
  methods: {
    getItemsUrl() {
      return '/api/projects';
    },
    getSingleItemUrl() {
      return `/api/project/${this.itemId}`;
    },
  },
};
</script>
