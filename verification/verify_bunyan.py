from playwright.sync_api import sync_playwright, expect
import time

def verify_bunyan_app():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        context = browser.new_context(viewport={'width': 375, 'height': 812}) # Mobile viewport
        page = context.new_page()

        print("Navigating to app...")
        page.goto("http://localhost:8080")

        # Wait for app to load (look for "Welcome back" text equivalent)
        # Login Screen: 'تسجيل الدخول' (Title)
        print("Waiting for Login Screen...")
        try:
            expect(page.get_by_text("تسجيل الدخول").first).to_be_visible(timeout=30000)
        except Exception as e:
            print(f"Login screen text not found: {e}")
            page.screenshot(path="verification/error_login_timeout.png")
            return

        print("Taking screenshot: Login Screen")
        time.sleep(1) # Extra wait for fonts
        page.screenshot(path="verification/01_login_screen.png")

        # Go to Register
        print("Navigating to Register Screen...")
        page.get_by_text("إنشاء حساب").click()
        expect(page.get_by_text("أهلاً بك")).to_be_visible()

        print("Taking screenshot: Register Screen")
        time.sleep(1)
        page.screenshot(path="verification/02_register_screen.png")

        # Go back to Login (using the text button "تسجيل الدخول" at bottom of register)
        page.get_by_role("button", name="تسجيل الدخول").click()
        expect(page.get_by_text("مرحباً بك مجدداً")).to_be_visible()

        # Login (Perform fake login)
        print("Performing Login...")
        page.get_by_label("البريد الإلكتروني").fill("test@test.com")
        page.get_by_label("كلمة المرور").fill("password123")

        # Click the main login button. There are two "تسجيل الدخول" texts (Title and Button).
        # The button is usually a button role.
        # But wait, the button text is exactly 'تسجيل الدخول'.
        # Let's use get_by_role('button', name='تسجيل الدخول').
        page.get_by_role("button", name="تسجيل الدخول").click()

        # Wait for Home Screen
        print("Waiting for Home Screen...")
        expect(page.get_by_text("مرحباً بك 👋")).to_be_visible()

        print("Taking screenshot: Home Screen")
        time.sleep(1)
        page.screenshot(path="verification/03_home_screen.png")

        # Navigate to Menu (Bottom Nav "المزيد")
        print("Navigating to Menu...")
        page.get_by_text("المزيد").click()

        # Wait for Menu Content (e.g., 'الملف الشخصي')
        expect(page.get_by_text("الملف الشخصي")).to_be_visible()

        print("Taking screenshot: Menu Screen")
        time.sleep(1)
        page.screenshot(path="verification/04_menu_screen.png")

        browser.close()
        print("Verification complete.")

if __name__ == "__main__":
    verify_bunyan_app()
