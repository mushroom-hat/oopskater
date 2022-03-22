.class public Lcom/tpcstld/twozerogame/MainGame;
.super Ljava/lang/Object;
.source "MainGame.java"


# static fields
.field static final FADE_GLOBAL_ANIMATION:I = 0x0

.field private static final FIRST_RUN:Ljava/lang/String; = "first run"

.field private static final GAME_ENDLESS:I = 0x2

.field private static final GAME_ENDLESS_WON:I = 0x3

.field private static final GAME_LOST:I = -0x1

.field private static final GAME_NORMAL:I = 0x0

.field private static final GAME_WIN:I = 0x1

.field private static final HIGH_SCORE:Ljava/lang/String; = "high score"

.field static final MERGE_ANIMATION:I = 0x1

.field static final MOVE_ANIMATION:I = 0x0

.field private static final MOVE_ANIMATION_TIME:J = 0x5f5e100L

.field private static final NOTIFICATION_ANIMATION_TIME:J = 0x1dcd6500L

.field private static final NOTIFICATION_DELAY_TIME:J = 0xbebc200L

.field static final SPAWN_ANIMATION:I = -0x1

.field private static final SPAWN_ANIMATION_TIME:J = 0x5f5e100L

.field private static endingMaxValue:I = 0x0

.field private static final startingMaxValue:I = 0x800


# instance fields
.field aGrid:Lcom/tpcstld/twozerogame/AnimationGrid;

.field private bufferGameState:I

.field private bufferScore:J

.field canUndo:Z

.field gameState:I

.field grid:Lcom/tpcstld/twozerogame/Grid;

.field highScore:J

.field lastGameState:I

.field lastScore:J

.field private final mContext:Landroid/content/Context;

.field private final mView:Lcom/tpcstld/twozerogame/MainView;

.field final numSquaresX:I

.field final numSquaresY:I

.field public score:J


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/tpcstld/twozerogame/MainView;)V
    .locals 2

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 33
    iput v0, p0, Lcom/tpcstld/twozerogame/MainGame;->gameState:I

    .line 34
    iput v0, p0, Lcom/tpcstld/twozerogame/MainGame;->lastGameState:I

    .line 35
    iput v0, p0, Lcom/tpcstld/twozerogame/MainGame;->bufferGameState:I

    const/4 v0, 0x4

    .line 41
    iput v0, p0, Lcom/tpcstld/twozerogame/MainGame;->numSquaresX:I

    .line 42
    iput v0, p0, Lcom/tpcstld/twozerogame/MainGame;->numSquaresY:I

    const/4 v0, 0x0

    .line 45
    iput-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    const-wide/16 v0, 0x0

    .line 48
    iput-wide v0, p0, Lcom/tpcstld/twozerogame/MainGame;->score:J

    .line 49
    iput-wide v0, p0, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    .line 50
    iput-wide v0, p0, Lcom/tpcstld/twozerogame/MainGame;->lastScore:J

    .line 51
    iput-wide v0, p0, Lcom/tpcstld/twozerogame/MainGame;->bufferScore:J

    .line 54
    iput-object p1, p0, Lcom/tpcstld/twozerogame/MainGame;->mContext:Landroid/content/Context;

    .line 55
    iput-object p2, p0, Lcom/tpcstld/twozerogame/MainGame;->mView:Lcom/tpcstld/twozerogame/MainView;

    .line 56
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 p1, 0x14

    int-to-double p1, p1

    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->pow(DD)D

    move-result-wide p1

    double-to-int p1, p1

    sput p1, Lcom/tpcstld/twozerogame/MainGame;->endingMaxValue:I

    return-void
.end method

.method private addRandomTile()V
    .locals 5

    .line 98
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/Grid;->isCellsAvailable()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 99
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    const-wide v2, 0x3feccccccccccccdL    # 0.9

    cmpg-double v4, v0, v2

    if-gez v4, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    .line 100
    :goto_0
    new-instance v1, Lcom/tpcstld/twozerogame/Tile;

    iget-object v2, p0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    invoke-virtual {v2}, Lcom/tpcstld/twozerogame/Grid;->randomAvailableCell()Lcom/tpcstld/twozerogame/Cell;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/tpcstld/twozerogame/Tile;-><init>(Lcom/tpcstld/twozerogame/Cell;I)V

    .line 101
    invoke-direct {p0, v1}, Lcom/tpcstld/twozerogame/MainGame;->spawnTile(Lcom/tpcstld/twozerogame/Tile;)V

    :cond_1
    return-void
.end method

.method private addStartTiles()V
    .locals 2

    .line 83
    invoke-static {}, Lcom/tpcstld/twozerogame/DebugTools;->generatePremadeMap()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 85
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/tpcstld/twozerogame/Tile;

    .line 86
    invoke-direct {p0, v1}, Lcom/tpcstld/twozerogame/MainGame;->spawnTile(Lcom/tpcstld/twozerogame/Tile;)V

    goto :goto_0

    :cond_0
    return-void

    :cond_1
    const/4 v0, 0x2

    const/4 v1, 0x0

    :goto_1
    if-ge v1, v0, :cond_2

    .line 93
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainGame;->addRandomTile()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method private buildTraversalsX(Lcom/tpcstld/twozerogame/Cell;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tpcstld/twozerogame/Cell;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 303
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x4

    if-ge v1, v2, :cond_0

    .line 306
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 308
    :cond_0
    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result p1

    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    .line 309
    invoke-static {v0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    :cond_1
    return-object v0
.end method

.method private buildTraversalsY(Lcom/tpcstld/twozerogame/Cell;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tpcstld/twozerogame/Cell;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 316
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x4

    if-ge v1, v2, :cond_0

    .line 319
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 321
    :cond_0
    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result p1

    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    .line 322
    invoke-static {v0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    :cond_1
    return-object v0
.end method

.method private checkLose()V
    .locals 1

    .line 278
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainGame;->movesAvailable()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainGame;->gameWon()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, -0x1

    .line 279
    iput v0, p0, Lcom/tpcstld/twozerogame/MainGame;->gameState:I

    .line 280
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainGame;->endGame()V

    :cond_0
    return-void
.end method

.method private endGame()V
    .locals 9

    .line 285
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->aGrid:Lcom/tpcstld/twozerogame/AnimationGrid;

    const/4 v1, -0x1

    const/4 v2, -0x1

    const/4 v3, 0x0

    const-wide/32 v4, 0x1dcd6500

    const-wide/32 v6, 0xbebc200

    const/4 v8, 0x0

    invoke-virtual/range {v0 .. v8}, Lcom/tpcstld/twozerogame/AnimationGrid;->startAnimation(IIIJJ[I)V

    .line 286
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/MainGame;->score:J

    iget-wide v2, p0, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    cmp-long v4, v0, v2

    if-ltz v4, :cond_0

    .line 287
    iput-wide v0, p0, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    .line 288
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainGame;->recordHighScore()V

    :cond_0
    return-void
.end method

.method private findFarthestPosition(Lcom/tpcstld/twozerogame/Cell;Lcom/tpcstld/twozerogame/Cell;)[Lcom/tpcstld/twozerogame/Cell;
    .locals 4

    .line 330
    new-instance v0, Lcom/tpcstld/twozerogame/Cell;

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v1

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result p1

    invoke-direct {v0, v1, p1}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    .line 333
    :goto_0
    new-instance p1, Lcom/tpcstld/twozerogame/Cell;

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v1

    invoke-virtual {p2}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v2

    add-int/2addr v1, v2

    .line 334
    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result v2

    invoke-virtual {p2}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result v3

    add-int/2addr v2, v3

    invoke-direct {p1, v1, v2}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    .line 335
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    invoke-virtual {v1, p1}, Lcom/tpcstld/twozerogame/Grid;->isCellWithinBounds(Lcom/tpcstld/twozerogame/Cell;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    invoke-virtual {v1, p1}, Lcom/tpcstld/twozerogame/Grid;->isCellAvailable(Lcom/tpcstld/twozerogame/Cell;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    move-object v0, p1

    goto :goto_0

    :cond_1
    :goto_1
    const/4 p2, 0x2

    .line 337
    new-array p2, p2, [Lcom/tpcstld/twozerogame/Cell;

    const/4 v1, 0x0

    aput-object v0, p2, v1

    const/4 v0, 0x1

    aput-object p1, p2, v0

    return-object p2
.end method

.method private firstRun()Z
    .locals 5

    .line 139
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const/4 v1, 0x1

    const-string v2, "first run"

    .line 140
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_0

    .line 141
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 142
    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 143
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return v1

    :cond_0
    return v4
.end method

.method private getHighScore()J
    .locals 4

    .line 134
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "high score"

    const-wide/16 v2, -0x1

    .line 135
    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method private getVector(I)Lcom/tpcstld/twozerogame/Cell;
    .locals 5

    const/4 v0, 0x4

    .line 293
    new-array v0, v0, [Lcom/tpcstld/twozerogame/Cell;

    new-instance v1, Lcom/tpcstld/twozerogame/Cell;

    const/4 v2, -0x1

    const/4 v3, 0x0

    invoke-direct {v1, v3, v2}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    aput-object v1, v0, v3

    new-instance v1, Lcom/tpcstld/twozerogame/Cell;

    const/4 v4, 0x1

    invoke-direct {v1, v4, v3}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    aput-object v1, v0, v4

    new-instance v1, Lcom/tpcstld/twozerogame/Cell;

    invoke-direct {v1, v3, v4}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    const/4 v4, 0x2

    aput-object v1, v0, v4

    new-instance v1, Lcom/tpcstld/twozerogame/Cell;

    invoke-direct {v1, v2, v3}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    .line 299
    aget-object p1, v0, p1

    return-object p1
.end method

.method private moveTile(Lcom/tpcstld/twozerogame/Tile;Lcom/tpcstld/twozerogame/Cell;)V
    .locals 3

    .line 160
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    iget-object v0, v0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Tile;->getX()I

    move-result v1

    aget-object v0, v0, v1

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Tile;->getY()I

    move-result v1

    const/4 v2, 0x0

    aput-object v2, v0, v1

    .line 161
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    iget-object v0, v0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    invoke-virtual {p2}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v1

    aget-object v0, v0, v1

    invoke-virtual {p2}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result v1

    aput-object p1, v0, v1

    .line 162
    invoke-virtual {p1, p2}, Lcom/tpcstld/twozerogame/Tile;->updatePosition(Lcom/tpcstld/twozerogame/Cell;)V

    return-void
.end method

.method private movesAvailable()Z
    .locals 1

    .line 341
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/Grid;->isCellsAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainGame;->tileMatchesAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private positionsEqual(Lcom/tpcstld/twozerogame/Cell;Lcom/tpcstld/twozerogame/Cell;)Z
    .locals 2

    .line 370
    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v0

    invoke-virtual {p2}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result p1

    invoke-virtual {p2}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result p2

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private prepareTiles()V
    .locals 9

    .line 150
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    iget-object v0, v0, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_2

    aget-object v4, v0, v3

    .line 151
    array-length v5, v4

    const/4 v6, 0x0

    :goto_1
    if-ge v6, v5, :cond_1

    aget-object v7, v4, v6

    .line 152
    iget-object v8, p0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    invoke-virtual {v8, v7}, Lcom/tpcstld/twozerogame/Grid;->isCellOccupied(Lcom/tpcstld/twozerogame/Cell;)Z

    move-result v8

    if-eqz v8, :cond_0

    const/4 v8, 0x0

    .line 153
    invoke-virtual {v7, v8}, Lcom/tpcstld/twozerogame/Tile;->setMergedFrom([Lcom/tpcstld/twozerogame/Tile;)V

    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private prepareUndoState()V
    .locals 2

    .line 173
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/Grid;->prepareSaveTiles()V

    .line 174
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/MainGame;->score:J

    iput-wide v0, p0, Lcom/tpcstld/twozerogame/MainGame;->bufferScore:J

    .line 175
    iget v0, p0, Lcom/tpcstld/twozerogame/MainGame;->gameState:I

    iput v0, p0, Lcom/tpcstld/twozerogame/MainGame;->bufferGameState:I

    return-void
.end method

.method private recordHighScore()V
    .locals 4

    .line 112
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 113
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 114
    iget-wide v1, p0, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    const-string v3, "high score"

    invoke-interface {v0, v3, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 115
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 117
    new-instance v0, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;

    iget-wide v1, p0, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    invoke-direct {v0, v1, v2}, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;-><init>(J)V

    .line 118
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainGame;->mContext:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->saveSnapshot(Landroid/content/Context;Lcom/tpcstld/twozerogame/snapshot/SnapshotData;)V

    return-void
.end method

.method private saveUndoState()V
    .locals 2

    .line 166
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/Grid;->saveTiles()V

    const/4 v0, 0x1

    .line 167
    iput-boolean v0, p0, Lcom/tpcstld/twozerogame/MainGame;->canUndo:Z

    .line 168
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/MainGame;->bufferScore:J

    iput-wide v0, p0, Lcom/tpcstld/twozerogame/MainGame;->lastScore:J

    .line 169
    iget v0, p0, Lcom/tpcstld/twozerogame/MainGame;->bufferGameState:I

    iput v0, p0, Lcom/tpcstld/twozerogame/MainGame;->lastGameState:I

    return-void
.end method

.method private spawnTile(Lcom/tpcstld/twozerogame/Tile;)V
    .locals 10

    .line 106
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    invoke-virtual {v0, p1}, Lcom/tpcstld/twozerogame/Grid;->insertTile(Lcom/tpcstld/twozerogame/Tile;)V

    .line 107
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainGame;->aGrid:Lcom/tpcstld/twozerogame/AnimationGrid;

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Tile;->getX()I

    move-result v2

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/Tile;->getY()I

    move-result v3

    const/4 v4, -0x1

    const-wide/32 v5, 0x5f5e100

    const-wide/32 v7, 0x5f5e100

    const/4 v9, 0x0

    invoke-virtual/range {v1 .. v9}, Lcom/tpcstld/twozerogame/AnimationGrid;->startAnimation(IIIJJ[I)V

    return-void
.end method

.method private tileMatchesAvailable()Z
    .locals 9

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x4

    if-ge v1, v2, :cond_3

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v2, :cond_2

    .line 349
    iget-object v4, p0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    new-instance v5, Lcom/tpcstld/twozerogame/Cell;

    invoke-direct {v5, v1, v3}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    invoke-virtual {v4, v5}, Lcom/tpcstld/twozerogame/Grid;->getCellContent(Lcom/tpcstld/twozerogame/Cell;)Lcom/tpcstld/twozerogame/Tile;

    move-result-object v4

    if-eqz v4, :cond_1

    const/4 v5, 0x0

    :goto_2
    if-ge v5, v2, :cond_1

    .line 353
    invoke-direct {p0, v5}, Lcom/tpcstld/twozerogame/MainGame;->getVector(I)Lcom/tpcstld/twozerogame/Cell;

    move-result-object v6

    .line 354
    new-instance v7, Lcom/tpcstld/twozerogame/Cell;

    invoke-virtual {v6}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v8

    add-int/2addr v8, v1

    invoke-virtual {v6}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result v6

    add-int/2addr v6, v3

    invoke-direct {v7, v8, v6}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    .line 356
    iget-object v6, p0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    invoke-virtual {v6, v7}, Lcom/tpcstld/twozerogame/Grid;->getCellContent(Lcom/tpcstld/twozerogame/Cell;)Lcom/tpcstld/twozerogame/Tile;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 358
    invoke-virtual {v6}, Lcom/tpcstld/twozerogame/Tile;->getValue()I

    move-result v6

    invoke-virtual {v4}, Lcom/tpcstld/twozerogame/Tile;->getValue()I

    move-result v7

    if-ne v6, v7, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    return v0
.end method

.method private winValue()I
    .locals 1

    .line 374
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainGame;->canContinue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 375
    sget v0, Lcom/tpcstld/twozerogame/MainGame;->endingMaxValue:I

    return v0

    :cond_0
    const/16 v0, 0x800

    return v0
.end method


# virtual methods
.method canContinue()Z
    .locals 2

    .line 388
    iget v0, p0, Lcom/tpcstld/twozerogame/MainGame;->gameState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method gameLost()Z
    .locals 2

    .line 195
    iget v0, p0, Lcom/tpcstld/twozerogame/MainGame;->gameState:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method gameWon()Z
    .locals 1

    .line 191
    iget v0, p0, Lcom/tpcstld/twozerogame/MainGame;->gameState:I

    if-lez v0, :cond_0

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method handleSnapshot(Lcom/tpcstld/twozerogame/snapshot/SnapshotData;)V
    .locals 4

    .line 122
    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->getHighScore()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    .line 123
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainGame;->mContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 124
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 125
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    const-string v2, "high score"

    invoke-interface {p1, v2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 126
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 128
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainGame;->mView:Lcom/tpcstld/twozerogame/MainView;

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/MainView;->invalidate()V

    .line 130
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Successfully loaded snapshot from Cloud Save: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method isActive()Z
    .locals 1

    .line 199
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainGame;->gameWon()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainGame;->gameLost()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method move(I)V
    .locals 34

    move-object/from16 v0, p0

    .line 203
    iget-object v1, v0, Lcom/tpcstld/twozerogame/MainGame;->aGrid:Lcom/tpcstld/twozerogame/AnimationGrid;

    invoke-virtual {v1}, Lcom/tpcstld/twozerogame/AnimationGrid;->cancelAnimations()V

    .line 205
    invoke-virtual/range {p0 .. p0}, Lcom/tpcstld/twozerogame/MainGame;->isActive()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    .line 208
    :cond_0
    invoke-direct/range {p0 .. p0}, Lcom/tpcstld/twozerogame/MainGame;->prepareUndoState()V

    .line 209
    invoke-direct/range {p0 .. p1}, Lcom/tpcstld/twozerogame/MainGame;->getVector(I)Lcom/tpcstld/twozerogame/Cell;

    move-result-object v1

    .line 210
    invoke-direct {v0, v1}, Lcom/tpcstld/twozerogame/MainGame;->buildTraversalsX(Lcom/tpcstld/twozerogame/Cell;)Ljava/util/List;

    move-result-object v2

    .line 211
    invoke-direct {v0, v1}, Lcom/tpcstld/twozerogame/MainGame;->buildTraversalsY(Lcom/tpcstld/twozerogame/Cell;)Ljava/util/List;

    move-result-object v3

    .line 214
    invoke-direct/range {p0 .. p0}, Lcom/tpcstld/twozerogame/MainGame;->prepareTiles()V

    .line 216
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v5, 0x0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 217
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_1
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 218
    new-instance v9, Lcom/tpcstld/twozerogame/Cell;

    invoke-direct {v9, v6, v8}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    .line 219
    iget-object v10, v0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    invoke-virtual {v10, v9}, Lcom/tpcstld/twozerogame/Grid;->getCellContent(Lcom/tpcstld/twozerogame/Cell;)Lcom/tpcstld/twozerogame/Tile;

    move-result-object v10

    const/4 v11, 0x1

    if-eqz v10, :cond_5

    .line 222
    invoke-direct {v0, v9, v1}, Lcom/tpcstld/twozerogame/MainGame;->findFarthestPosition(Lcom/tpcstld/twozerogame/Cell;Lcom/tpcstld/twozerogame/Cell;)[Lcom/tpcstld/twozerogame/Cell;

    move-result-object v12

    .line 223
    iget-object v13, v0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    aget-object v14, v12, v11

    invoke-virtual {v13, v14}, Lcom/tpcstld/twozerogame/Grid;->getCellContent(Lcom/tpcstld/twozerogame/Cell;)Lcom/tpcstld/twozerogame/Tile;

    move-result-object v13

    const/4 v14, 0x2

    if-eqz v13, :cond_4

    .line 225
    invoke-virtual {v13}, Lcom/tpcstld/twozerogame/Tile;->getValue()I

    move-result v15

    invoke-virtual {v10}, Lcom/tpcstld/twozerogame/Tile;->getValue()I

    move-result v4

    if-ne v15, v4, :cond_4

    invoke-virtual {v13}, Lcom/tpcstld/twozerogame/Tile;->getMergedFrom()[Lcom/tpcstld/twozerogame/Tile;

    move-result-object v4

    if-nez v4, :cond_4

    .line 226
    new-instance v4, Lcom/tpcstld/twozerogame/Tile;

    aget-object v15, v12, v11

    invoke-virtual {v10}, Lcom/tpcstld/twozerogame/Tile;->getValue()I

    move-result v16

    mul-int/lit8 v11, v16, 0x2

    invoke-direct {v4, v15, v11}, Lcom/tpcstld/twozerogame/Tile;-><init>(Lcom/tpcstld/twozerogame/Cell;I)V

    .line 227
    new-array v11, v14, [Lcom/tpcstld/twozerogame/Tile;

    const/4 v15, 0x0

    aput-object v10, v11, v15

    const/16 v16, 0x1

    aput-object v13, v11, v16

    .line 228
    invoke-virtual {v4, v11}, Lcom/tpcstld/twozerogame/Tile;->setMergedFrom([Lcom/tpcstld/twozerogame/Tile;)V

    .line 230
    iget-object v11, v0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    invoke-virtual {v11, v4}, Lcom/tpcstld/twozerogame/Grid;->insertTile(Lcom/tpcstld/twozerogame/Tile;)V

    .line 231
    iget-object v11, v0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    invoke-virtual {v11, v10}, Lcom/tpcstld/twozerogame/Grid;->removeTile(Lcom/tpcstld/twozerogame/Tile;)V

    .line 234
    aget-object v11, v12, v16

    invoke-virtual {v10, v11}, Lcom/tpcstld/twozerogame/Tile;->updatePosition(Lcom/tpcstld/twozerogame/Cell;)V

    .line 236
    new-array v11, v14, [I

    aput v6, v11, v15

    aput v8, v11, v16

    .line 237
    iget-object v8, v0, Lcom/tpcstld/twozerogame/MainGame;->aGrid:Lcom/tpcstld/twozerogame/AnimationGrid;

    invoke-virtual {v4}, Lcom/tpcstld/twozerogame/Tile;->getX()I

    move-result v18

    invoke-virtual {v4}, Lcom/tpcstld/twozerogame/Tile;->getY()I

    move-result v19

    const/16 v20, 0x0

    const-wide/32 v21, 0x5f5e100

    const-wide/16 v23, 0x0

    move-object/from16 v17, v8

    move-object/from16 v25, v11

    invoke-virtual/range {v17 .. v25}, Lcom/tpcstld/twozerogame/AnimationGrid;->startAnimation(IIIJJ[I)V

    .line 239
    iget-object v8, v0, Lcom/tpcstld/twozerogame/MainGame;->aGrid:Lcom/tpcstld/twozerogame/AnimationGrid;

    invoke-virtual {v4}, Lcom/tpcstld/twozerogame/Tile;->getX()I

    move-result v26

    invoke-virtual {v4}, Lcom/tpcstld/twozerogame/Tile;->getY()I

    move-result v27

    const/16 v28, 0x1

    const-wide/32 v29, 0x5f5e100

    const-wide/32 v31, 0x5f5e100

    const/16 v33, 0x0

    move-object/from16 v25, v8

    invoke-virtual/range {v25 .. v33}, Lcom/tpcstld/twozerogame/AnimationGrid;->startAnimation(IIIJJ[I)V

    .line 243
    iget-wide v11, v0, Lcom/tpcstld/twozerogame/MainGame;->score:J

    invoke-virtual {v4}, Lcom/tpcstld/twozerogame/Tile;->getValue()I

    move-result v8

    int-to-long v13, v8

    add-long/2addr v11, v13

    iput-wide v11, v0, Lcom/tpcstld/twozerogame/MainGame;->score:J

    .line 244
    iget-wide v11, v0, Lcom/tpcstld/twozerogame/MainGame;->score:J

    iget-wide v13, v0, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    invoke-static {v11, v12, v13, v14}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v11

    iput-wide v11, v0, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    .line 245
    iget-wide v11, v0, Lcom/tpcstld/twozerogame/MainGame;->score:J

    iget-wide v13, v0, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    cmp-long v8, v11, v13

    if-ltz v8, :cond_2

    .line 246
    iput-wide v11, v0, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    .line 247
    invoke-direct/range {p0 .. p0}, Lcom/tpcstld/twozerogame/MainGame;->recordHighScore()V

    .line 251
    :cond_2
    invoke-virtual {v4}, Lcom/tpcstld/twozerogame/Tile;->getValue()I

    move-result v4

    invoke-direct/range {p0 .. p0}, Lcom/tpcstld/twozerogame/MainGame;->winValue()I

    move-result v8

    if-lt v4, v8, :cond_3

    invoke-virtual/range {p0 .. p0}, Lcom/tpcstld/twozerogame/MainGame;->gameWon()Z

    move-result v4

    if-nez v4, :cond_3

    .line 252
    iget v4, v0, Lcom/tpcstld/twozerogame/MainGame;->gameState:I

    const/4 v8, 0x1

    add-int/2addr v4, v8

    iput v4, v0, Lcom/tpcstld/twozerogame/MainGame;->gameState:I

    .line 253
    invoke-direct/range {p0 .. p0}, Lcom/tpcstld/twozerogame/MainGame;->endGame()V

    :cond_3
    const/4 v4, 0x0

    const/4 v13, 0x1

    goto :goto_2

    :cond_4
    const/4 v4, 0x0

    .line 256
    aget-object v11, v12, v4

    invoke-direct {v0, v10, v11}, Lcom/tpcstld/twozerogame/MainGame;->moveTile(Lcom/tpcstld/twozerogame/Tile;Lcom/tpcstld/twozerogame/Cell;)V

    const/4 v11, 0x3

    .line 257
    new-array v11, v11, [I

    aput v6, v11, v4

    const/4 v13, 0x1

    aput v8, v11, v13

    aput v4, v11, v14

    .line 258
    iget-object v8, v0, Lcom/tpcstld/twozerogame/MainGame;->aGrid:Lcom/tpcstld/twozerogame/AnimationGrid;

    aget-object v14, v12, v4

    invoke-virtual {v14}, Lcom/tpcstld/twozerogame/Cell;->getX()I

    move-result v18

    aget-object v12, v12, v4

    invoke-virtual {v12}, Lcom/tpcstld/twozerogame/Cell;->getY()I

    move-result v19

    const/16 v20, 0x0

    const-wide/32 v21, 0x5f5e100

    const-wide/16 v23, 0x0

    move-object/from16 v17, v8

    move-object/from16 v25, v11

    invoke-virtual/range {v17 .. v25}, Lcom/tpcstld/twozerogame/AnimationGrid;->startAnimation(IIIJJ[I)V

    .line 261
    :goto_2
    invoke-direct {v0, v9, v10}, Lcom/tpcstld/twozerogame/MainGame;->positionsEqual(Lcom/tpcstld/twozerogame/Cell;Lcom/tpcstld/twozerogame/Cell;)Z

    move-result v8

    if-nez v8, :cond_1

    const/4 v5, 0x1

    goto/16 :goto_1

    :cond_5
    const/4 v4, 0x0

    goto/16 :goto_1

    :cond_6
    const/4 v4, 0x0

    goto/16 :goto_0

    :cond_7
    if-eqz v5, :cond_8

    .line 269
    invoke-direct/range {p0 .. p0}, Lcom/tpcstld/twozerogame/MainGame;->saveUndoState()V

    .line 270
    invoke-direct/range {p0 .. p0}, Lcom/tpcstld/twozerogame/MainGame;->addRandomTile()V

    .line 271
    invoke-direct/range {p0 .. p0}, Lcom/tpcstld/twozerogame/MainGame;->checkLose()V

    .line 273
    :cond_8
    iget-object v1, v0, Lcom/tpcstld/twozerogame/MainGame;->mView:Lcom/tpcstld/twozerogame/MainView;

    invoke-virtual {v1}, Lcom/tpcstld/twozerogame/MainView;->resyncTime()V

    .line 274
    iget-object v1, v0, Lcom/tpcstld/twozerogame/MainGame;->mView:Lcom/tpcstld/twozerogame/MainView;

    invoke-virtual {v1}, Lcom/tpcstld/twozerogame/MainView;->invalidate()V

    return-void
.end method

.method newGame()V
    .locals 5

    .line 60
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    const/4 v1, 0x4

    if-nez v0, :cond_0

    .line 61
    new-instance v0, Lcom/tpcstld/twozerogame/Grid;

    invoke-direct {v0, v1, v1}, Lcom/tpcstld/twozerogame/Grid;-><init>(II)V

    iput-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    goto :goto_0

    .line 63
    :cond_0
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainGame;->prepareUndoState()V

    .line 64
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainGame;->saveUndoState()V

    .line 65
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/Grid;->clearGrid()V

    .line 67
    :goto_0
    new-instance v0, Lcom/tpcstld/twozerogame/AnimationGrid;

    invoke-direct {v0, v1, v1}, Lcom/tpcstld/twozerogame/AnimationGrid;-><init>(II)V

    iput-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->aGrid:Lcom/tpcstld/twozerogame/AnimationGrid;

    .line 68
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainGame;->getHighScore()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    .line 69
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/MainGame;->score:J

    iget-wide v2, p0, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    cmp-long v4, v0, v2

    if-ltz v4, :cond_1

    .line 70
    iput-wide v0, p0, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    .line 71
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainGame;->recordHighScore()V

    .line 73
    :cond_1
    invoke-static {}, Lcom/tpcstld/twozerogame/DebugTools;->getStartingScore()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/tpcstld/twozerogame/MainGame;->score:J

    const/4 v0, 0x0

    .line 74
    iput v0, p0, Lcom/tpcstld/twozerogame/MainGame;->gameState:I

    .line 75
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainGame;->addStartTiles()V

    .line 76
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->mView:Lcom/tpcstld/twozerogame/MainView;

    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainGame;->firstRun()Z

    move-result v1

    iput-boolean v1, v0, Lcom/tpcstld/twozerogame/MainView;->showHelp:Z

    .line 77
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->mView:Lcom/tpcstld/twozerogame/MainView;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/tpcstld/twozerogame/MainView;->refreshLastTime:Z

    .line 78
    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/MainView;->resyncTime()V

    .line 79
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->mView:Lcom/tpcstld/twozerogame/MainView;

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/MainView;->invalidate()V

    return-void
.end method

.method revertUndoState()V
    .locals 2

    .line 179
    iget-boolean v0, p0, Lcom/tpcstld/twozerogame/MainGame;->canUndo:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 180
    iput-boolean v0, p0, Lcom/tpcstld/twozerogame/MainGame;->canUndo:Z

    .line 181
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->aGrid:Lcom/tpcstld/twozerogame/AnimationGrid;

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/AnimationGrid;->cancelAnimations()V

    .line 182
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/Grid;->revertTiles()V

    .line 183
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/MainGame;->lastScore:J

    iput-wide v0, p0, Lcom/tpcstld/twozerogame/MainGame;->score:J

    .line 184
    iget v0, p0, Lcom/tpcstld/twozerogame/MainGame;->lastGameState:I

    iput v0, p0, Lcom/tpcstld/twozerogame/MainGame;->gameState:I

    .line 185
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->mView:Lcom/tpcstld/twozerogame/MainView;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/tpcstld/twozerogame/MainView;->refreshLastTime:Z

    .line 186
    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/MainView;->invalidate()V

    :cond_0
    return-void
.end method

.method setEndlessMode()V
    .locals 2

    const/4 v0, 0x2

    .line 382
    iput v0, p0, Lcom/tpcstld/twozerogame/MainGame;->gameState:I

    .line 383
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->mView:Lcom/tpcstld/twozerogame/MainView;

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/MainView;->invalidate()V

    .line 384
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainGame;->mView:Lcom/tpcstld/twozerogame/MainView;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/tpcstld/twozerogame/MainView;->refreshLastTime:Z

    return-void
.end method
