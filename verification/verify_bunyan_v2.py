from playwright.sync_api import sync_playwright, expect
import time

def verify_bunyan_app_v2():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        context = browser.new_context(viewport={'width': 375, 'height': 812}) # Mobile viewport
        page = context.new_page()

        print("Navigating to app...")
        page.goto("http://localhost:8080")

        # Wait for app to load (look for "Welcome back" text equivalent)
        print("Waiting for Login Screen...")
        try:
            expect(page.get_by_text("تسجيل الدخول").first).to_be_visible(timeout=30000)
        except Exception as e:
            print(f"Login screen text not found: {e}")
            page.screenshot(path="verification_v2/error_login_timeout.png")
            return

        print("Taking screenshot: Login Screen V2 (Cairo Font, #AF5500)")
        time.sleep(2) # Extra wait for font swap
        page.screenshot(path="verification_v2/login_screen_v2.png")

        browser.close()
        print("Verification complete.")

if __name__ == "__main__":
    verify_bunyan_app_v2()
