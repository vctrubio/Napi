<template>
  <div>
    <b-container fluid class="bv-example-row">
      <b-row>
        <b-col
          class="orders-table">
            <vxe-toolbar>
              <template v-slot:buttons>
                <vxe-input v-model="filterOrdersTable" type="search" placeholder="Search an order"></vxe-input>
                <vxe-button status="primary" @click="newOrderModal()" content="Create an order" size="medium"></vxe-button>
              </template>
            </vxe-toolbar>
            <vxe-table
              border
              stripe
              show-header-overflow
              show-overflow
              max-height="500px"
              highlight-hover-row
              :data="filterOrdersTableData">
              <vxe-table-column type="seq" title="S.No." width="100"></vxe-table-column>
              <vxe-table-column type="html" :formatter="formatRole" field="age" title="Client Address"></vxe-table-column>
              <vxe-table-column field="time" title="Time"></vxe-table-column>
              <vxe-table-column field="price" title="Price"></vxe-table-column>
              <vxe-table-column field="paid" title="Paid">
                <vxe-switch></vxe-switch>
              </vxe-table-column>
              <vxe-table-column field="delivered" title="Delivered">
                <vxe-switch></vxe-switch>
              </vxe-table-column>
              <template v-slot:empty>
                <span style="color: black;">
                  <p>No data found</p>
                </span>
              </template>
          </vxe-table>
          <vxe-modal ref="createOrderModal" v-model="openNewOrderDialog" title="Create order form" width="800" resize destroy-on-close>
          <template v-slot>
            <vxe-form :data="formData" :rules="formRules" title-align="right" title-width="100" @submit="submitEvent">
             
              <vxe-form-item title="Client Name" field="name" span="15" :item-render="{name: 'input', attrs: {placeholder: 'name'}}"></vxe-form-item>
              <vxe-form-item title="Date" field="date" span="15" :item-render="{name: 'input', attrs: {type: 'date', placeholder: 'Date'}}"></vxe-form-item>
              <vxe-form-item title="Time" field="time" span="15" :item-render="{name: 'input', attrs: {type: 'time', placeholder: 'Time'}}"></vxe-form-item>
              <vxe-form-item title="Paid" field="paid" span="15">
                <vxe-switch></vxe-switch>
              </vxe-form-item>
              <vxe-form-item title="Receipt kg" field="receipt_kg" span="15" :item-render="{name: 'input', attrs: {placeholder: 'in kg'}}"></vxe-form-item>
              <vxe-form-item title="Receipt fruit" field="receipt_fruit" span="15" :item-render="{name: 'input', attrs: {placeholder: 'fruit name'}}"></vxe-form-item>
              <vxe-form-item align="center" span="24">
                <template v-slot>
                  <vxe-button type="submit" status="primary">Submit</vxe-button>
                  <vxe-button type="reset">Reset</vxe-button>
                  <vxe-button @click="$refs.createOrderModal.close()">Close</vxe-button>
                </template>
              </vxe-form-item>
            </vxe-form>
          </template>
        </vxe-modal>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>
<script src="./orders-layout.js"></script>
<style scoped src="./orders-layout.css"></style>