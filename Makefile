GAMES_DIR = apps/hxgm30.mush/priv/games
UNDERWOOD_NAME = undirvithr
UNDERWOOD_REPO = git@github.com:cnbb-games/$(UNDERWOOD_NAME).git
UNDERWOOD = $(GAMES_DIR)/$(UNDERWOOD_NAME)

underwood-add:
	cd $(GAMES_DIR) && \
	git submodule add $(UNDERWOOD_REPO) && \
	cd - && \
	git add .gitmodules && \
	git commit -am "Added $(UNDERWOOD_NAME) submodule."

underwood-update:
	git pull 
	cd $(GAMES_DIR)/undirvithr && \
	git commit -am "Updated story content." && \
	git pull --rebase && \
	git push && \
	cd - && \
	git commit .gitmodules $(GAMES_DIR)/undirvithr -m "Updated $(UNDERWOOD_NAME)."

games: underwood-add

games-update: underwood-update
