# 🧙‍♂️ Perminator  
**Evil bits be gone.**

Perminator is a lightweight, privacy-respecting macOS utility for understanding and modifying file permissions using a visual interface. Whether you're an advanced user or just trying to make sense of `chmod 4755`, Perminator gives you a clear and editable breakdown of permission bits.

---

## ✨ Why Perminator?

Unix file permissions are powerful but opaque. `chmod` is a Swiss Army knife of privilege, but few people can glance at `2751` and know what it really means. **Perminator casts out confusion** by providing:

### ✅ A visual interface for:
- **Owner**, **Group**, and **Other** permissions (Read, Write, Execute)
- **Special bits**:  
  - 🧢 **SetUID**: Run executable as the file owner  
  - 🧢 **SetGID**: Run executable as the group owner or set group on new files in directories  
  - 🧹 **Sticky Bit**: Only file owners can delete files in a shared directory

---

## 🧠 Features

- ✍️ **Live permission builder**  
  Tweak checkboxes and instantly see the resulting octal and symbolic values.

- 🔢 **Octal input field**  
  Know your desired permission value? Type it in and watch the toggles update in real time.

- 🔗 **Drag-and-drop file support**  
  Drop a file into Perminator to inspect and visualize its permissions.

- 📋 **One-click copy**  
  Copy the octal value to your clipboard, ready to paste into any terminal command.

- 🧠 **Input validation**  
  Warns you if your `chmod` value isn’t valid—because it should *just work*.

- 💾 **Remembers your last used value**  
  Next time you open the app, Perminator picks up right where you left off.

- 🌍 **Supports 12 Languages**  
  Perminator is localized and ready to help, no matter your native tongue:

  - 🇺🇸 English  
  - 🇭🇰 Chinese (Hong Kong)  
  - 🇨🇳 Chinese (Simplified)  
  - 🇫🇮 Finnish  
  - 🇫🇷 French  
  - 🇩🇪 German  
  - 🇮🇹 Italian  
  - 🇯🇵 Japanese  
  - 🇰🇷 Korean  
  - 🇧🇷 Portuguese (Brazil)  
  - 🇪🇸 Spanish  
  - 🇺🇦 Ukrainian  

---

## 💡 Why the name?

> **Perminator**:  
> A play on *permissions* and *The Terminator* because you’re casting out configuration bugs.  
> **Evil bits be gone.**

---

## 📦 Available On

- macOS 15+
- Optimized for Apple Silicon

---

## 🔗 Learn More

👉 Visit [perminator.sodini.io](https://perminator.sodini.io) for help, updates, and developer notes.
