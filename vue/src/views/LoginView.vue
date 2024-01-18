<template>
  <div id="login">
    <div id="home">
      <router-link v-bind:to="{ name: 'home' }" class="white-link">Home</router-link>
    </div>
    <form v-on:submit.prevent="login">
      <h1>Please Sign In</h1>
      <div role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div role="alert" v-if="this.$route.query.registration">
        Thank you for registering, please sign in.
      </div>
      <div class="form-input-group">
        <label for="username">Username</label>
        <input type="text" id="username" v-model="user.username" required autofocus />
      </div>
      <div class="form-input-group">
        <label for="password">Password</label>
        <input type="password" id="password" v-model="user.password" required />
      </div>
      <button type="submit">Sign in</button>
      <p>
        <router-link v-bind:to="{ name: 'register' }" class="white-link">Need an account? Sign up.</router-link>
      </p>
    </form>


  </div>

  <div class="footer">
    <FooterView />
  </div>
</template>

<script>
import authService from "../services/AuthService";
import FooterView from "./FooterView.vue";

export default {
  components: {
    FooterView
  },
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style scoped>
.white-link {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  color: rgb(0, 0, 0);
  font-weight: bold;
}

p {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  font-size: 1.5rem;
  text-decoration: none;
}


.footer {
  height: 3rem;
}


#brewscout {
  width: 20rem;
  height: 20rem;
  margin-top: 2rem;
}



input {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  width: 9rem;
  height: 1rem;
  margin-bottom: 1rem;
  text-align: center;

}

h1 {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  font-size: 2rem;
}

.form-input-group {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  margin-bottom: 2rem;
  text-align: center;
  color: rgb(0, 0, 0);
  font-weight: bold;
}

label {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  margin-right: 0.5rem;
  text-align: center;

}

#login {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  /* background-image: url('../assets/img/homePage2.png'); */
  background-color:  rgb(0, 140, 255);
  height: 52rem;
  text-align: center;
}

#home {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  text-align: center;
  color: white;
  font-size: 2rem;
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