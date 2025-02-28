<template lang="html">
    <div class="container">
      <div class="row">
        <div class="col text-left">
          <h2>Profile</h2>
  
          <div v-if="isLoading">
            <p>Loading data...</p>
          </div>
          <div v-else-if="error">
            <p>Error loading data: {{ error }}</p>
          </div>
          <div v-else-if="profileUser.length > 0">
            <div class="profile-list">
              <div v-for="user in profileUser" :key="user.id_profile" class="profile-item">
                  <div class="profile-item-header">
                      <img v-if="user.profilePic" :src="user.profilePic" alt="Profile Picture" class="profile-pic" />
                      <span v-else>No image</span>
                      <h3>{{user.full_name}}</h3>
                  </div>
                
                <ul class="profile-details">
                  <li><strong>ID:</strong> {{ user.id_profile }}</li>
                  <li><strong>Fecha de Nacimiento:</strong> {{ user.birth_day }}</li>
                  <li><strong>Dirección:</strong> {{ user.address }}</li>
                  <li><strong>Estado Civil:</strong> {{ user.marital_status }}</li>
                  <li><strong>Sitio Web:</strong> <a v-if="user.website" :href="user.website" target="_blank">{{ user.website }}</a> <span v-else>No website</span></li>
                  <li><strong>Correo Electrónico:</strong> {{ user.email }}</li>
                  <li><strong>Licencia de Conducir:</strong> {{ user.driver_license }}</li>
                </ul>
              </div>
            </div>
          </div>
          <div v-else>
            <p>No data available.</p>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        profileUser: [],
        isLoading: false,
        error: null,
      };
    },
  
    methods: {
      async getProfile() {
        this.isLoading = true;
        this.error = null;
        const path = 'http://127.0.0.1:8000/portfolioapi/profile/';
  
        try {
          const response = await axios.get(path);
          this.profileUser = response.data;
        } catch (err) {
          console.error(err);
          this.error =
            'There was an error loading data, check the console for details';
        } finally {
          this.isLoading = false;
        }
      },
    },
  
    mounted() {
      this.getProfile();
    },
  };
  </script>
  
  <style scoped>
  .profile-list {
    display: flex;
    flex-direction: column;
    gap: 20px; /* Adjust spacing between profile items */
  }
  
  .profile-item {
    border: 1px solid #ccc;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }
  
  .profile-item-header{
      display: flex;
      align-items: center;
      gap: 10px;
      margin-bottom: 10px;
  }
  
  .profile-details {
    list-style: none;
    padding: 0;
  }
  
  .profile-details li {
    margin-bottom: 5px;
  }
  
  .profile-pic {
    width: 80px; /* Increased size */
    height: 80px; /* Increased size */
    border-radius: 50%;
    object-fit: cover;
  }
  </style>
  