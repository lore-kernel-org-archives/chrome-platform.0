Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A3C17C3
	for <chrome-platform@lists.linux.dev>; Sat, 22 Oct 2022 00:39:43 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id f11so6935173wrm.6
        for <chrome-platform@lists.linux.dev>; Fri, 21 Oct 2022 17:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hc0MY9P+cZKXmulCt400/B6TSDO3aHtAVhctVQyPng0=;
        b=LTvCpcBIfC9FcqvoOO+BXnY1/ToJDsdKKpPmXtoVK0T7hXkaLTUAPMws8PObo9+uLg
         NAXF7BnAXF/nIvOcA1XV9WqaVsqbZACu4VuGfdKvhaF9MpYZ+MCy0DB4l3XpV8xIDEoB
         i8oJOrZvMyB9CI8OhAPh+w4OnEYz6VX0mJdAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hc0MY9P+cZKXmulCt400/B6TSDO3aHtAVhctVQyPng0=;
        b=aZQUpL8dtD0BIYM5LD8G15Q1NxreWAykSln8kIlNpCWSE4CnxlaE5Vi0HdHreqjDl8
         mlzrHfOKf3uYqa7SRHY4irslTYIQh4j5Hv+IUuHA/P5kOb3rgG4zwYR3v1O2l2Yrx3Qo
         4exPf46r5rjdGZ9BJ5RA7FEgHKGaK1kLpOGkqBe/bZl1t2EVVADasp1RXzqTDo79Bzl/
         CyT5r7rF8TxHwMDhVCWrTv9W35YoT5q9ijz0vnUhsnKN96GmczOHDeG8JES9NhkdDC1/
         dxLctg9bUl5iT7fHkwLDq+a6qsaR2ZbyJ+c0JZMlw6tVPWHEYNl3h6DD9TH5HfMIKfwG
         gRGA==
X-Gm-Message-State: ACrzQf0kPlnCbUCfwQ69Ur7prowooxE7ak+PxsKAJsjivDp+MKnhOABF
	mbd2sgXzzL7kDEM061YyTmxt8rP3DPLJyFwrECXW5Q==
X-Google-Smtp-Source: AMsMyM6k6eBDfOkQqD6qdN/r+CohI4L4WcJ2hyiHj1ceBIUyEGXrbUgO9yuhhDSbDFXQVpKGoyqAQhIrTGndIY/I1RQ=
X-Received: by 2002:a5d:588c:0:b0:231:891c:6fc1 with SMTP id
 n12-20020a5d588c000000b00231891c6fc1mr13822884wrf.25.1666399181341; Fri, 21
 Oct 2022 17:39:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221021172624.1.I119456791d197eb7d159f09e7479d8759008a954@changeid>
In-Reply-To: <20221021172624.1.I119456791d197eb7d159f09e7479d8759008a954@changeid>
From: Julius Werner <jwerner@chromium.org>
Date: Fri, 21 Oct 2022 17:39:29 -0700
Message-ID: <CAODwPW-73ZJaurNVC8TD8MdRVDenfAFTXM67xCdZan5DE6_s6Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add drivers/firmware/google/ entry
To: Brian Norris <briannorris@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tzung-Bi Shih <tzungbi@google.com>, 
	Julius Werner <jwerner@chromium.org>, chrome-platform@lists.linux.dev, 
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, 
	Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Acked-by: Julius Werner <jwerner@chromium.org>
