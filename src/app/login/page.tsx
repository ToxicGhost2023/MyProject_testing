export default function LoginPage() {
  async function formAction(formData: FormData) {
    "use server";
    const rawFormData = {
      email: formData.get("email"),
      password: formData.get("password"),
    };

    if (!rawFormData) {
      return;
    }
  }
  return (
    <form action={formAction}>
      <h1>Login</h1>
      <input type="email" placeholder="Email" required />
      <input type="password" placeholder="Password" required />

      <button type="submit">Login</button>
    </form>
  );
}
