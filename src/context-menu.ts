declare interface Window {
    api: {
        showContextMenu(x: number, y: number): void;
    };
}

window.addEventListener('contextmenu', (e) => {
    e.preventDefault();    
}, false);

class MenuOption {
    name: string;
    func: () => void;
    enabled: boolean;
  
    constructor(name: string, func: () => void, enabled = true) {
      this.name = name;
      this.func = func;
      this.enabled = enabled;
    }
  }
  
  class ContextMenu {
    private menuOptions: MenuOption[];
    private menuElement: HTMLElement;
  
    constructor(menuOptions: MenuOption[]) {
      this.menuOptions = menuOptions;
      this.menuElement = document.createElement('div');
      this.menuElement.classList.add('context-menu');
      this.menuElement.style.display = 'none';
      document.body.appendChild(this.menuElement);
      this.render();
    }
  
    private render() {
      this.menuElement.innerHTML = '';
      for (const option of this.menuOptions) {
        const optionElement = document.createElement('div');
        optionElement.classList.add('context-menu-option');
        optionElement.textContent = option.name;
        optionElement.addEventListener('click', () => {
          option.func();
          this.close();
        });
        if (!option.enabled) {
          optionElement.classList.add('disabled');
        }
        this.menuElement.appendChild(optionElement);
      }
    }
  
    open(x: number, y: number) {
      this.render();
      this.menuElement.style.left = `${x}px`;
      this.menuElement.style.top = `${y}px`;
      this.menuElement.style.display = 'block';
    }
  
    close() {
      this.menuElement.style.display = 'none';
    }
  }
  
  const menu = new ContextMenu([
    new MenuOption('Edit...', () => {
      console.log('Option 1 clicked');
    }),
    new MenuOption('Do something drastic', () => {
      console.log('Option 2 clicked');
    }, false)
  ]);
  
  window.addEventListener('contextmenu', (e) => {
    e.preventDefault();
    menu.open(e.x, e.y);
  }, false);
  
  window.addEventListener('click', () => {
    menu.close();
  }, false);
