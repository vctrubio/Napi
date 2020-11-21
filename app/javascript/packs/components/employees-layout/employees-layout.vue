<template>
  <div>
    <b-container fluid class="bv-example-row">
      <b-row>
        <b-col
          class="employees-table">
            <vxe-toolbar>
              <template v-slot:buttons>
                <vxe-input v-model="filterEmployeesTable" type="search" placeholder="Search an order"></vxe-input>
                <vxe-button status="primary" @click="newEmployeeModal()" content="Create an employee" size="medium"></vxe-button>
              </template>
            </vxe-toolbar>
            <vxe-table
              border
              stripe
              show-header-overflow
              show-overflow
              max-height="500px"
              highlight-hover-row
              :data="filterEmployeesTableData">
              <vxe-table-column type="seq" title="S.No." width="100"></vxe-table-column>
              <vxe-table-column type="html" max-width="262" :formatter="formatRole" field="name" title="Name"></vxe-table-column>
              <vxe-table-column field="age" max-width="262" title="Clients count"></vxe-table-column>
              <vxe-table-column field="phone" max-width="262" title="Phone"></vxe-table-column>
              <vxe-table-column field="fdf" max-width="262" title="Cash"></vxe-table-column>
              <template v-slot:empty>
                <span style="color: black;">
                  <p>No data found</p>
                </span>
              </template>
          </vxe-table>
          <vxe-modal ref="createEmployeeModal" v-model="openNewEmployeeDialog" title="Create employee form" width="800" resize destroy-on-close>
          <template v-slot>
            <vxe-form :data="formData" :rules="formRules" title-align="right" title-width="100" @submit="submitEvent">
             
              <vxe-form-item title="Name" field="name" span="15" :item-render="{name: 'input', attrs: {placeholder: 'name'}}"></vxe-form-item>
              <vxe-form-item title="Phone" field="phone" span="15" :item-render="{name: 'input', attrs: {placeholder: 'address'}}"></vxe-form-item>
              <vxe-form-item title="Description" field="description" span="15" :item-render="{name: 'textarea', attrs: {placeholder: 'description'}}"></vxe-form-item>
              <vxe-form-item title="Cash" field="cash" span="15" :item-render="{name: 'input', attrs: {placeholder: 'cash'}}"></vxe-form-item>
              
              <vxe-form-item align="center" span="24">
                <template v-slot>
                  <vxe-button type="submit" status="primary">Submit</vxe-button>
                  <vxe-button type="reset">Reset</vxe-button>
                  <vxe-button @click="$refs.createEmployeeModal.close()">Close</vxe-button>
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
<script src="./employees-layout.js"></script>
<style scoped src="./employees-layout.css"></style>