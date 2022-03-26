.class public Lcom/tpcstld/twozerogame/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.java"


# static fields
.field private static final CAN_UNDO:Ljava/lang/String; = "can undo"

.field private static final GAME_STATE:Ljava/lang/String; = "game state"

.field private static final HEIGHT:Ljava/lang/String; = "height"

.field private static final HIGH_SCORE:Ljava/lang/String; = "high score temp"

.field private static final NO_LOGIN_PROMPT:Ljava/lang/String; = "no_login_prompt"

.field private static final RC_SIGN_IN:I = 0x2329

.field private static final SCORE:Ljava/lang/String; = "score"

.field private static final UNDO_GAME_STATE:Ljava/lang/String; = "undo game state"

.field private static final UNDO_GRID:Ljava/lang/String; = "undo"

.field private static final UNDO_SCORE:Ljava/lang/String; = "undo score"

.field private static final WIDTH:Ljava/lang/String; = "width"


# instance fields
.field private firstLoginAttempt:Z

.field private view:Lcom/tpcstld/twozerogame/MainView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    const/4 v0, 0x0

    .line 41
    iput-boolean v0, p0, Lcom/tpcstld/twozerogame/MainActivity;->firstLoginAttempt:Z

    return-void
.end method

.method static synthetic access$000(Lcom/tpcstld/twozerogame/MainActivity;)Z
    .locals 0

    .line 25
    iget-boolean p0, p0, Lcom/tpcstld/twozerogame/MainActivity;->firstLoginAttempt:Z

    return p0
.end method

.method static synthetic access$002(Lcom/tpcstld/twozerogame/MainActivity;Z)Z
    .locals 0

    .line 25
    iput-boolean p1, p0, Lcom/tpcstld/twozerogame/MainActivity;->firstLoginAttempt:Z

    return p1
.end method

.method static synthetic access$100(Lcom/tpcstld/twozerogame/MainActivity;)Lcom/tpcstld/twozerogame/MainView;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    return-object p0
.end method

.method private load()V
    .locals 10

    .line 133
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v0, v0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v0, v0, Lcom/tpcstld/twozerogame/MainGame;->aGrid:Lcom/tpcstld/twozerogame/AnimationGrid;

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/AnimationGrid;->cancelAnimations()V

    .line 135
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 136
    :goto_0
    iget-object v3, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v3, v3, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v3, v3, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    iget-object v3, v3, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    array-length v3, v3

    if-ge v2, v3, :cond_5

    const/4 v3, 0x0

    .line 137
    :goto_1
    iget-object v4, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v4, v4, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v4, v4, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    iget-object v4, v4, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object v4, v4, v1

    array-length v4, v4

    if-ge v3, v4, :cond_4

    .line 138
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v6, -0x1

    invoke-interface {v0, v4, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    const/4 v7, 0x0

    if-lez v4, :cond_0

    .line 140
    iget-object v8, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v8, v8, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v8, v8, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    iget-object v8, v8, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object v8, v8, v2

    new-instance v9, Lcom/tpcstld/twozerogame/Tile;

    invoke-direct {v9, v2, v3, v4}, Lcom/tpcstld/twozerogame/Tile;-><init>(III)V

    aput-object v9, v8, v3

    goto :goto_2

    :cond_0
    if-nez v4, :cond_1

    .line 142
    iget-object v8, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v8, v8, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v8, v8, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    iget-object v8, v8, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object v8, v8, v2

    aput-object v7, v8, v3

    .line 145
    :cond_1
    :goto_2
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "undo"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    if-lez v5, :cond_2

    .line 147
    iget-object v4, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v4, v4, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v4, v4, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    iget-object v4, v4, Lcom/tpcstld/twozerogame/Grid;->undoField:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object v4, v4, v2

    new-instance v6, Lcom/tpcstld/twozerogame/Tile;

    invoke-direct {v6, v2, v3, v5}, Lcom/tpcstld/twozerogame/Tile;-><init>(III)V

    aput-object v6, v4, v3

    goto :goto_3

    :cond_2
    if-nez v4, :cond_3

    .line 149
    iget-object v4, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v4, v4, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v4, v4, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    iget-object v4, v4, Lcom/tpcstld/twozerogame/Grid;->undoField:[[Lcom/tpcstld/twozerogame/Tile;

    aget-object v4, v4, v2

    aput-object v7, v4, v3

    :cond_3
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 154
    :cond_5
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v1, v1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v2, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v2, v2, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-wide v2, v2, Lcom/tpcstld/twozerogame/MainGame;->score:J

    const-string v4, "score"

    invoke-interface {v0, v4, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    iput-wide v2, v1, Lcom/tpcstld/twozerogame/MainGame;->score:J

    .line 155
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v1, v1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v2, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v2, v2, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-wide v2, v2, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    const-string v4, "high score temp"

    invoke-interface {v0, v4, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    iput-wide v2, v1, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    .line 156
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v1, v1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v2, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v2, v2, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-wide v2, v2, Lcom/tpcstld/twozerogame/MainGame;->lastScore:J

    const-string v4, "undo score"

    invoke-interface {v0, v4, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    iput-wide v2, v1, Lcom/tpcstld/twozerogame/MainGame;->lastScore:J

    .line 157
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v1, v1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v2, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v2, v2, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-boolean v2, v2, Lcom/tpcstld/twozerogame/MainGame;->canUndo:Z

    const-string v3, "can undo"

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, v1, Lcom/tpcstld/twozerogame/MainGame;->canUndo:Z

    .line 158
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v1, v1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v2, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v2, v2, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget v2, v2, Lcom/tpcstld/twozerogame/MainGame;->gameState:I

    const-string v3, "game state"

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, v1, Lcom/tpcstld/twozerogame/MainGame;->gameState:I

    .line 159
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v1, v1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v2, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v2, v2, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget v2, v2, Lcom/tpcstld/twozerogame/MainGame;->lastGameState:I

    const-string v3, "undo game state"

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, v1, Lcom/tpcstld/twozerogame/MainGame;->lastGameState:I

    return-void
.end method

.method private save()V
    .locals 9

    .line 95
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 96
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 97
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v1, v1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v1, v1, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    iget-object v1, v1, Lcom/tpcstld/twozerogame/Grid;->field:[[Lcom/tpcstld/twozerogame/Tile;

    .line 98
    iget-object v2, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v2, v2, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v2, v2, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    iget-object v2, v2, Lcom/tpcstld/twozerogame/Grid;->undoField:[[Lcom/tpcstld/twozerogame/Tile;

    .line 99
    array-length v3, v1

    const-string v4, "width"

    invoke-interface {v0, v4, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 100
    array-length v3, v1

    const-string v4, "height"

    invoke-interface {v0, v4, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 101
    :goto_0
    array-length v5, v1

    if-ge v4, v5, :cond_3

    const/4 v5, 0x0

    .line 102
    :goto_1
    aget-object v6, v1, v3

    array-length v6, v6

    if-ge v5, v6, :cond_2

    .line 103
    aget-object v6, v1, v4

    aget-object v6, v6, v5

    const-string v7, " "

    if-eqz v6, :cond_0

    .line 104
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aget-object v8, v1, v4

    aget-object v8, v8, v5

    invoke-virtual {v8}, Lcom/tpcstld/twozerogame/Tile;->getValue()I

    move-result v8

    invoke-interface {v0, v6, v8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_2

    .line 106
    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 109
    :goto_2
    aget-object v6, v2, v4

    aget-object v6, v6, v5

    const-string v8, "undo"

    if-eqz v6, :cond_1

    .line 110
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aget-object v7, v2, v4

    aget-object v7, v7, v5

    invoke-virtual {v7}, Lcom/tpcstld/twozerogame/Tile;->getValue()I

    move-result v7

    invoke-interface {v0, v6, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_3

    .line 112
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_1

    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 116
    :cond_3
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v1, v1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-wide v1, v1, Lcom/tpcstld/twozerogame/MainGame;->score:J

    const-string v3, "score"

    invoke-interface {v0, v3, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 117
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v1, v1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-wide v1, v1, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    const-string v3, "high score temp"

    invoke-interface {v0, v3, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 118
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v1, v1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-wide v1, v1, Lcom/tpcstld/twozerogame/MainGame;->lastScore:J

    const-string v3, "undo score"

    invoke-interface {v0, v3, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 119
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v1, v1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-boolean v1, v1, Lcom/tpcstld/twozerogame/MainGame;->canUndo:Z

    const-string v2, "can undo"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 120
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v1, v1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget v1, v1, Lcom/tpcstld/twozerogame/MainGame;->gameState:I

    const-string v2, "game state"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 121
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object v1, v1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget v1, v1, Lcom/tpcstld/twozerogame/MainGame;->lastGameState:I

    const-string v2, "undo game state"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 122
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private signInToGoogle()V
    .locals 4

    .line 166
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "no_login_prompt"

    .line 167
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 168
    new-instance v2, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;

    sget-object v3, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->DEFAULT_GAMES_SIGN_IN:Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    invoke-direct {v2, v3}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;-><init>(Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;)V

    sget-object v3, Lcom/google/android/gms/drive/Drive;->SCOPE_APPFOLDER:Lcom/google/android/gms/common/api/Scope;

    new-array v1, v1, [Lcom/google/android/gms/common/api/Scope;

    .line 170
    invoke-virtual {v2, v3, v1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;->requestScopes(Lcom/google/android/gms/common/api/Scope;[Lcom/google/android/gms/common/api/Scope;)Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;

    move-result-object v1

    .line 171
    invoke-virtual {v1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;->build()Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    move-result-object v1

    .line 172
    invoke-static {p0, v1}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getClient(Landroid/app/Activity;Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;)Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    move-result-object v1

    .line 173
    invoke-virtual {v1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;->silentSignIn()Lcom/google/android/gms/tasks/Task;

    move-result-object v2

    new-instance v3, Lcom/tpcstld/twozerogame/MainActivity$1;

    invoke-direct {v3, p0, v0, v1}, Lcom/tpcstld/twozerogame/MainActivity$1;-><init>(Lcom/tpcstld/twozerogame/MainActivity;ZLcom/google/android/gms/auth/api/signin/GoogleSignInClient;)V

    invoke-virtual {v2, p0, v3}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Landroid/app/Activity;Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 202
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 p2, 0x2329

    if-eq p1, p2, :cond_0

    return-void

    .line 207
    :cond_0
    sget-object p1, Lcom/google/android/gms/auth/api/Auth;->GoogleSignInApi:Lcom/google/android/gms/auth/api/signin/GoogleSignInApi;

    invoke-interface {p1, p3}, Lcom/google/android/gms/auth/api/signin/GoogleSignInApi;->getSignInResultFromIntent(Landroid/content/Intent;)Lcom/google/android/gms/auth/api/signin/GoogleSignInResult;

    move-result-object p1

    if-nez p1, :cond_1

    return-void

    .line 212
    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInResult;->isSuccess()Z

    move-result p2

    if-nez p2, :cond_2

    .line 213
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p2

    .line 214
    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    const/4 p3, 0x1

    const-string v0, "no_login_prompt"

    .line 215
    invoke-interface {p2, v0, p3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 216
    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 217
    sget-object p2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInResult;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_0

    .line 219
    :cond_2
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInResult;->getSignInAccount()Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object p2

    if-eqz p2, :cond_3

    .line 220
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInResult;->getSignInAccount()Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/google/android/gms/games/Games;->getGamesClient(Landroid/app/Activity;Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)Lcom/google/android/gms/games/GamesClient;

    move-result-object p1

    .line 221
    iget-object p2, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    invoke-interface {p1, p2}, Lcom/google/android/gms/games/GamesClient;->setViewForPopups(Landroid/view/View;)Lcom/google/android/gms/tasks/Task;

    .line 223
    :cond_3
    new-instance p1, Lcom/tpcstld/twozerogame/MainActivity$2;

    invoke-direct {p1, p0}, Lcom/tpcstld/twozerogame/MainActivity$2;-><init>(Lcom/tpcstld/twozerogame/MainActivity;)V

    invoke-static {p0, p1}, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->loadSnapshot(Landroid/content/Context;Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$Callback;)V

    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 47
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 48
    new-instance v0, Lcom/tpcstld/twozerogame/MainView;

    invoke-direct {v0, p0}, Lcom/tpcstld/twozerogame/MainView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    .line 50
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 51
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    const-string v2, "save_state"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, v1, Lcom/tpcstld/twozerogame/MainView;->hasSaveState:Z

    if-eqz p1, :cond_0

    const-string v0, "hasState"

    .line 54
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 55
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainActivity;->load()V

    .line 58
    :cond_0
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    invoke-virtual {p0, p1}, Lcom/tpcstld/twozerogame/MainActivity;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2

    const/4 v0, 0x1

    const/16 v1, 0x52

    if-ne p1, v1, :cond_0

    return v0

    :cond_0
    const/16 v1, 0x14

    if-ne p1, v1, :cond_1

    .line 67
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    const/4 p2, 0x2

    invoke-virtual {p1, p2}, Lcom/tpcstld/twozerogame/MainGame;->move(I)V

    return v0

    :cond_1
    const/16 v1, 0x13

    if-ne p1, v1, :cond_2

    .line 70
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/tpcstld/twozerogame/MainGame;->move(I)V

    return v0

    :cond_2
    const/16 v1, 0x15

    if-ne p1, v1, :cond_3

    .line 73
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    const/4 p2, 0x3

    invoke-virtual {p1, p2}, Lcom/tpcstld/twozerogame/MainGame;->move(I)V

    return v0

    :cond_3
    const/16 v1, 0x16

    if-ne p1, v1, :cond_4

    .line 76
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainActivity;->view:Lcom/tpcstld/twozerogame/MainView;

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {p1, v0}, Lcom/tpcstld/twozerogame/MainGame;->move(I)V

    return v0

    .line 79
    :cond_4
    invoke-super {p0, p1, p2}, Landroidx/appcompat/app/AppCompatActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method protected onPause()V
    .locals 0

    .line 90
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onPause()V

    .line 91
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainActivity;->save()V

    return-void
.end method

.method protected onResume()V
    .locals 0

    .line 126
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onResume()V

    .line 127
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainActivity;->load()V

    .line 128
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainActivity;->signInToGoogle()V

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 84
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "hasState"

    const/4 v1, 0x1

    .line 85
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 86
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainActivity;->save()V

    return-void
.end method
