<template>
  <div class="portfolio-container">
    <div class="portfolio-card">
      <nav class="navbar">
        <div class="logo">Portfolio.</div>
        <div class="nav-links">
          <a href="#" class="active">Home</a>
          <a href="#">About</a>
          <a href="#">Skills</a>
          <a href="#">Portfolio</a>
          <a href="#">Contact</a>
        </div>
      </nav>
      
      <div class="content">
        <div class="intro-section">
          <div v-for="user in profileUser" :key="user.id_profile" class="intro-text">
            <h2>Hello, It's Me</h2>
            <h1> {{ user.full_name }} </h1>
            <h3>And I'm a <span class="highlight"> {{ user.position }} </span></h3>
            <p> {{ user.description }} </p>
            
            <div class="social-icons">
              <a href="#"><i class="fab fa-facebook-f"></i></a>
              <a href="#"><i class="fab fa-twitter"></i></a>
              <a href="#"><i class="fab fa-instagram"></i></a>
              <a href="#"><i class="fab fa-linkedin-in"></i></a>
            </div>
            
            <button class="download-btn">Download CV</button>
          </div>
          
          <div class="profile-image">
            <div class="hexagon">
              <img src="" alt="John Kendric">
            </div>
          </div>
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
      const path = 'http://127.0.0.1:8001/portfolioapi/profile/';

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

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css');

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}

.portfolio-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background: linear-gradient(135deg, #0c1220 0%, #122f40 100%);
  padding: 20px;
}

.portfolio-card {
  width: 100%;
  max-width: 1200px;
  background-color: #1a2130;
  border-radius: 20px;
  padding: 20px 40px;
  box-shadow: 0 0 30px rgba(0, 255, 255, 0.1);
  overflow: hidden;
}

.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 15px 0;
}

.logo {
  color: white;
  font-size: 1.5rem;
  font-weight: 600;
}

.nav-links {
  display: flex;
  gap: 30px;
}

.nav-links a {
  color: white;
  text-decoration: none;
  font-size: 0.9rem;
  transition: color 0.3s;
}

.nav-links a:hover, .nav-links a.active {
  color: #00e1ff;
}

.content {
  padding: 50px 0;
}

.intro-section {
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
}

.intro-text {
  flex: 1;
  min-width: 300px;
  color: white;
  padding-right: 20px;
}

.intro-text h2 {
  font-size: 1.5rem;
  font-weight: 500;
  margin-bottom: 10px;
}

.intro-text h1 {
  font-size: 3rem;
  font-weight: 700;
  margin-bottom: 10px;
}

.intro-text h3 {
  font-size: 1.3rem;
  font-weight: 500;
  margin-bottom: 20px;
}

.highlight {
  color: #00e1ff;
}

.intro-text p {
  color: #ccc;
  margin-bottom: 25px;
  max-width: 500px;
  line-height: 1.6;
}

.social-icons {
  display: flex;
  gap: 15px;
  margin-bottom: 30px;
}

.social-icons a {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  border: 1px solid #00e1ff;
  color: #00e1ff;
  transition: all 0.3s;
}

.social-icons a:hover {
  background-color: #00e1ff;
  color: #1a2130;
}

.download-btn {
  background-color: #00e1ff;
  color: #1a2130;
  border: none;
  padding: 12px 25px;
  border-radius: 30px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s;
}

.download-btn:hover {
  transform: translateY(-3px);
  box-shadow: 0 10px 20px rgba(0, 225, 255, 0.3);
}

.profile-image {
  flex: 1;
  min-width: 300px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.hexagon {
  position: relative;
  width: 320px;
  height: 350px;
  clip-path: polygon(50% 0%, 100% 25%, 100% 75%, 50% 100%, 0% 75%, 0% 25%);
  background-color: #00e1ff;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 0 0 30px rgba(0, 225, 255, 0.6);
}

.hexagon img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center;
}

@media (max-width: 768px) {
  .portfolio-card {
    padding: 20px;
  }
  
  .intro-section {
    flex-direction: column-reverse;
    gap: 40px;
  }
  
  .intro-text {
    padding-right: 0;
    text-align: center;
  }
  
  .social-icons {
    justify-content: center;
  }
  
  .nav-links {
    display: none;
  }
}
</style>