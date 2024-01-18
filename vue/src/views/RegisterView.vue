<template>
  <div class="header">
    <HeaderView />
  </div>
  <div id="login">
    <div id="home">
      <router-link v-bind:to="{ name: 'home' }" class="white-link">Home</router-link>
    </div>
    <div id="register" class="text-center">
      <form v-on:submit.prevent="register">
        <h1>Create Account</h1>
        <div role="alert" v-if="registrationErrors">
          {{ registrationErrorMsg }}
        </div>
        <div class="form-input-group">
          <label for="username">Username</label>
          <input type="text" id="username" v-model="user.username" required autofocus />
        </div>
        <div class="form-input-group">
          <label for="password">Password</label>
          <input type="password" id="password" v-model="user.password" required />
        </div>
        <div class="form-input-group">
          <label for="confirmPassword">Confirm Password</label>
          <input type="password" id="confirmPassword" v-model="user.confirmPassword" required />
        </div>
        <button type="submit">Create Account</button>
        <p><router-link v-bind:to="{ name: 'login' }" class="white-link">Already have an account? Log in.</router-link>
        </p>
      </form>
    </div>


  </div>
  <div class="footer">
    <FooterView />
  </div>
</template>

<script>
import HeaderView from "@/views/HeaderView.vue";
import authService from '../services/AuthService';
import FooterView from './FooterView.vue';

export default {
  components: {
    HeaderView,
    FooterView,
  },
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style scoped>
.white-link {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  color: rgb(0, 0, 0);
  font-weight: bold;
}


#login {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
background-image: url("../assets/img/register.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  height: 47.8rem;
  text-align: center;
}

.form-input-group {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  text-align: center;
  margin-bottom: 1rem;
  color: rgb(9, 9, 9);
  font-weight: bold;
}

label {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  margin-right: 0.5rem;
}

#home {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  text-align: center;
  font-size: 2rem;
  text-decoration: none;
}

p {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  font-size: 1.5rem;
  text-decoration: none;
}

button {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  background-color: rgb(255, 255, 255);
  border: 1px solid rgb(0, 0, 0);
  border-radius: 5px;
  padding: 5px 10px;
  margin-top: 10px;
  font-size: 12px;
  text-decoration: none;
}
</style>
