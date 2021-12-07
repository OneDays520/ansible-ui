<template xmlns:v-slot="http://www.w3.org/1999/XSL/Transform">
  <div v-if="items != null">
    <EditDialog
      v-model="editDialog"
      :save-button-text="itemId === 'new' ? '创建' : '保存'"
      :title="`${itemId === 'new' ? '新建' : 'Edit'}清单`"
      :max-width="450"
      @save="loadItems"
    >
      <template v-slot:form="{ onSave, onError, needSave, needReset }">
        <InventoryForm
          :project-id="projectId"
          :item-id="itemId"
          @save="onSave"
          @error="onError"
          :need-save="needSave"
          :need-reset="needReset"
        />
      </template>
    </EditDialog>

    <YesNoDialog
      title="Delete inventory"
      text="Are you really want to delete this inventory?"
      v-model="deleteItemDialog"
      @yes="deleteItem(itemId)"
    />

    <v-toolbar flat color="white">
      <v-app-bar-nav-icon @click="showDrawer()"></v-app-bar-nav-icon>
      <v-toolbar-title>主机清单</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn
        color="primary"
        @click="editItem('new')"
      >新建清单</v-btn>
    </v-toolbar>

    <v-data-table
      :headers="headers"
      :items="items"
      hide-default-footer
      class="mt-4"
      :items-per-page="Number.MAX_VALUE"
    >
      <template v-slot:item.type="{ item }">
        <code>{{ item.type }}</code>
      </template>
      <template v-slot:item.inventory="{ item }">
        {{ item.type === 'file' ? item.inventory : '&mdash;' }}
      </template>
      <template v-slot:item.actions="{ item }">
        <div style="white-space: nowrap">
          <v-btn
            icon
            class="mr-1"
            @click="askDeleteItem(item.id)"
          >
            <v-icon>mdi-delete</v-icon>
          </v-btn>

          <v-btn
            icon
            class="mr-1"
            @click="editItem(item.id)"
          >
            <v-icon>mdi-pencil</v-icon>
          </v-btn>
        </div>
      </template>
    </v-data-table>
  </div>

</template>
<script>
import ItemListPageBase from '@/components/ItemListPageBase';
import InventoryForm from '@/components/InventoryForm.vue';

export default {
  mixins: [ItemListPageBase],
  components: { InventoryForm },
  methods: {
    getHeaders() {
      return [{
        text: '名称',
        value: 'name',
        width: '33.33%',
      },
      {
        text: '类型',
        value: 'type',
        width: '33.33%',
      },
      {
        text: '路径',
        value: 'inventory',
        width: '33.33%',
      },
      {
        text: '动作',
        value: 'actions',
        sortable: false,
      }];
    },
    getItemsUrl() {
      return `/api/project/${this.projectId}/inventory`;
    },
    getSingleItemUrl() {
      return `/api/project/${this.projectId}/inventory/${this.itemId}`;
    },
    getEventName() {
      return 'i-inventory';
    },
  },
};
</script>
