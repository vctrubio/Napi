<template>
  <div>
    <b-container fluid class="bv-example-row">
      <b-row>
        <b-col
          class="clients-table">
            <vxe-toolbar>
              <template v-slot:buttons>
                <vxe-input v-model="filterClientsTable" type="search" placeholder="Search for a client"></vxe-input>
                <vxe-button status="primary" @click="newClientModal()" content="Create a client" size="medium"></vxe-button>
              </template>
            </vxe-toolbar>
            <vxe-table
              border
              stripe
              show-header-overflow
              show-overflow
              max-height="500px"
              highlight-hover-row
              :data="filterClientsTableData">
              <vxe-table-column type="seq" title="S.No." width="100"></vxe-table-column>
              <vxe-table-column type="html" max-width="262" :formatter="formatRole" field="sex" title="Name"></vxe-table-column>
              <vxe-table-column field="age" max-width="262" title="Address"></vxe-table-column>
              <vxe-table-column field="ferf" max-width="262" title="Phone"></vxe-table-column>
              <vxe-table-column field="fdf" max-width="262" title="Order Count"></vxe-table-column>
              <vxe-table-column field="fdfd" max-width="262" title="Last order Date"></vxe-table-column>
              <template v-slot:empty>
                <span style="color: black;">
                  <p>No data found</p>
                </span>
              </template>
          </vxe-table>
          <vxe-modal ref="createClientModal" v-model="openNewClientDialog" title="Create client form" width="800" resize destroy-on-close>
          <template v-slot>
            <vxe-form :data="formData" :rules="formRules" title-align="right" title-width="100" @submit="submitEvent">
              <vxe-form-item title="Employee Name" field="name" span="20">
                <vxe-select v-model="dedf" placeholder="Employee name">
                  <vxe-option v-for="num in 15" :key="num" :value="num" :label="`选项${num}`"></vxe-option>
                </vxe-select>
              </vxe-form-item>
              <vxe-form-item title="Name" field="name" span="20" :item-render="{name: 'input', attrs: {placeholder: 'name'}}"></vxe-form-item>
              <vxe-form-item title="Address" field="address" span="20" :item-render="{name: 'input', attrs: {placeholder: 'name'}}"></vxe-form-item>
              <vxe-form-item title="Phone" field="phone" span="20" :item-render="{name: 'input', attrs: {placeholder: 'name'}}"></vxe-form-item>
              <vxe-form-item title="Description" field="description" span="20" :item-render="{name: 'input', attrs: {placeholder: 'name'}}"></vxe-form-item>
              <vxe-form-item title="Rating" field="rating" span="20">
                <el-rate v-model="value1"></el-rate>
              </vxe-form-item>
            </vxe-form>
          </template>
        </vxe-modal>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>
<script src="./clients-layout.js"></script>
<style scoped src="./clients-layout.css"></style>