<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="p" type="viewmodel.HomepageViewModel" scope="request"/>
<!doctype html>
<html>
<head>

    <title>MasatsuguBookstore</title>
    <meta charset="utf-8">
    <meta name="description" content="The homepage for Futurist Press">

    <!--
        normalize-and-reset.css is a basic CSS reset; useful for starting from ground zero.
        always include this first.
    -->

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/normalize-and-reset.css"/>">

    <!--
        cascading appropriately, we have:

        main.css    --  all things common
        header.css  --  header-specific rules
        footer.css  --  footer-specific rules
        <page>.css  --  page-specific rules
        extras.css  --  extras you may want
    -->

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/header.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/footer.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/homepage.css"/>">

</head>

<body>

<main>
    <jsp:include page="header.jsp"/>
    <div id="upperHome">
        <section id="upperLeftHome">
            <div id="who">
                <p class="who" style="font-family:'Harlow Solid Italic'"><strong>Who are we?</strong></p>
                <p>We are the worlds </p>
                <p>premier Science Fiction </p>
                <p>book seller.</p>
                <br>
                <br>
                <br>
                <br>
                <p class="who" style="font-family:'Harlow Solid Italic'"><strong>Who are you?</strong></p>
                <p>You are a science fiction </p>
                <p>fan or buying a gift for a </p>
                <p>science fiction fan.</p>
            </div>
        </section>

        <section id="upperRightHome">
            <p id="featuredAuthorsTitle" style="font-family:'Harlow Solid Italic'"><strong>Featured Authors</strong></p>
            <br>
            <ul id="featuredAuthors">
                <li class="featuredAuthorsItems">
                    <div class="featuredAuthorsCenter">
                        <a href="category?category=humor">
                            <img src="${p.siteImagePath}earnestCline.gif" alt="Earnest Cline picture"/>
                        </a>
                        <button id="earnestCline">
                            <p>
                                <a href="category?category=humor"
                                   style="color:black; font-family:'Harlow Solid Italic'">Earnest Cline</a>
                            </p>
                        </button>
                    </div>
                </li>
                <li class="featuredAuthorsItems">
                    <div class="featuredAuthorsCenter">
                        <a href="category?category=cyberpunk">
                            <img src="${p.siteImagePath}richardMorgan.gif" alt="Richard Morgan picture"/>
                        </a>
                        <div id="richardMorgan">
                            <p>
                                <a href="category?category=cyberpunk"
                                   style="color:black; font-family:'Harlow Solid Italic'">Richard Morgan</a>
                            </p>
                        </div>
                    </div>
                </li>
                <li class="featuredAuthorsItems">
                    <div class="featuredAuthorsCenter">
                        <a href="category?category=space-opera">
                            <img src="${p.siteImagePath}jamesSACorey.gif" alt="James S.A. Corey picture"/>
                        </a>
                        <div id="jamesCorey">
                            <p>
                                <a href="category?category=space-opera"
                                   style="color:black; font-family:'Harlow Solid Italic'">James S.A. Corey</a>
                            </p>
                            <p>
                                <a href="category?category=space-opera"
                                   style="color:black; font-family:'Harlow Solid Italic'">(AKA Daniel Abraham &
                                    Ty Franck)
                                </a>
                            </p>
                        </div>
                    </div>
                </li>
                <li class="featuredAuthorsItems">
                    <div class="featuredAuthorsCenter">
                        <a href="category?category=alien-invasion">
                            <img src="${p.siteImagePath}cixinLiu.gif" alt="Cixin Liu picture"/>
                        </a>
                        <div id="cixinLiu">
                            <p>
                                <a href="category?category=alien-invasion"
                                   style="color:black; font-family:'Harlow Solid Italic'">Cixin Lui</a>
                            </p>
                        </div>
                    </div>
                </li>
            </ul>
        </section>
    </div>
    <div id="lowerHome">
        <section id="lowerLeftHome">
            <div id="recommendations">
                <p id="recommendationsTitle" style="font-family:'Harlow Solid Italic'"><strong>Recommendations?</strong>
                </p>
                <p>Thought you'd never ask! </p>
                <p>Click <a href="#">here</a> to get our staffs</p>
                <p> favorite titles, old and new.</p>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <p id="needToSellTitle" style="font-family:'Harlow Solid Italic'"><strong>Need to sell?</strong></p>
                <p>Looking to unload some </p>
                <p>of your collections? Click
                <p>
                    <a href="#">here</a> to get estimates.</p>
            </div>
        </section>

        <section id="lowerRightHome">
            <p id="featuredTitlesTitle" style="font-family:'Harlow Solid Italic'"><strong>Featured Titles</strong></p>
            <br>
            <ul id="featuredTitles">
                <li class="featuredTitlesItems">
                    <div class="featuredTitlesCenter">
                        <a href="category?category=humor">
                            <img src="${p.bookImagePath}ready-player-one.gif" alt="Ready Player One picture"/>
                        </a>
                        <div id="readyPlayerOne">
                            <p>
                                <a href="category?category=humor"
                                   style="color:black; font-family:'Harlow Solid Italic'">Ready Player One</a>
                            </p>
                        </div>
                    </div>
                </li>
                <li class="featuredTitlesItems">
                    <div class="featuredTitlesCenter">
                        <a href="category?category=cyberpunk">
                            <img src="${p.bookImagePath}altered-carbon.gif" alt="Altered Carbon picture"/>
                        </a>
                        <div id="alteredCarbon">
                            <p>
                                <a href="category?category=cyberpunk"
                                   style="color:black; font-family:'Harlow Solid Italic'">Altered Carbon</a>
                            </p>
                        </div>
                    </div>
                </li>
                <li class="featuredTitlesItems">
                    <div class="featuredTitlesCenter">
                        <a href="category?category=space-opera">
                            <img src="${p.bookImagePath}leviathan-wakes.gif" alt="Leviathan Wakes picture"/>
                        </a>
                        <div id="leviathanWakes">
                            <p>
                                <a href="category?category=space-opera"
                                   style="color:black; font-family:'Harlow Solid Italic'">Leviathan Wakes</a>
                            </p>
                        </div>
                    </div>
                </li>
                <li class="featuredTitlesItems">
                    <div class="featuredTitlesCenter">
                        <a href="category?category=post-apocalyptic">
                            <img src="${p.bookImagePath}the-three-body-problem.gif"
                                 alt="The Three-Body Problem picture"/>
                        </a>
                        <div id="wanderingEarth">
                            <p>
                                <a href="category?category=alien-invasion"
                                   style="color:black; font-family:'Harlow Solid Italic'">The Three-Body Problem</a>
                            </p>
                        </div>
                    </div>
                </li>
            </ul>
            <br>
            <p id="featuredThemesTitle" style="font-family:'Harlow Solid Italic'"><strong>Featured Themes</strong></p>
            <br>
            <ul id="featuredThemes">
                <li class="featuredThemesItems">
                    <div class="featuredThemesCenter">
                        <a href="category?category=steampunk">
                            <img src="${p.siteImagePath}steampunk.gif" alt="Steampunk picture"/>
                        </a>
                        <div id="steampunk">
                            <p>
                                <a href="category?category=steampunk"
                                   style="color:black; font-family:'Harlow Solid Italic'">Steampunk</a>
                            </p>
                        </div>
                    </div>
                </li>
                <li class="featuredThemesItems">
                    <div class="featuredThemesCenter">
                        <a href="category?category=young-adult">
                            <img src="${p.siteImagePath}youngAdult.gif" alt="Young Adult picture"/>
                        </a>
                        <div id="youngAdult">
                            <p>
                                <a href="category?category=young-adult"
                                   style="color:black; font-family:'Harlow Solid Italic'">Young Adult</a>
                            </p>
                        </div>
                    </div>
                </li>
                <li class="featuredThemesItems">
                    <div class="featuredThemesCenter">
                        <a href="category?category=cyberpunk">
                            <img src="${p.siteImagePath}cyberpunk.gif" alt="Cyberpunk picture"/>
                        </a>
                        <div id="cyberpunk">
                            <p>
                                <a href="category?category=cyberpunk"
                                   style="color:black; font-family:'Harlow Solid Italic'">Cyberpunk</a>
                            </p>
                        </div>
                    </div>
                </li>
                <li class="featuredThemesItems">
                    <div class="featuredThemesCenter">
                        <a href="category?category=post-apocalyptic">
                            <img src="${p.siteImagePath}postApocalypse.gif" alt="Post Apocalypse picture"/>
                        </a>
                        <div id="postApocalypse">
                            <p>
                                <a href="category?category=post-apocalyptic"
                                   style="color:black; font-family:'Harlow Solid Italic'">Post Apocalyptic</a>
                            </p>
                        </div>
                    </div>
                </li>
            </ul>
        </section>
    </div>
    <jsp:include page="footer.jsp"/>
</main>
</body>
</html>