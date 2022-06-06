Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A5B4C62
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 23:32:41 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-f2a4c51c45so21055939fac.9
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jun 2022 16:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=hQOXywD53mfOICrUlqm4ergu8RVMvPyByT866xTnrj4=;
        b=X0pxNxEcVR9XS4U5iXvbYSXUQK6/iECGViv3C4LCVQ/IunDo7i4p9wZxjDulQSpKGJ
         Ck8qrgJZ4pWPurmAF1Ab3qyFjCR0gew97jdg1gmpvUB1kh4p9lQbr8cGY0PHDAv3OY47
         q9x1BXrsMAM9UxXgKpPkXbJ0jZxr73z5+qJ4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=hQOXywD53mfOICrUlqm4ergu8RVMvPyByT866xTnrj4=;
        b=KhKwp5e33QMEUNL8VDlomu2F3kf1eMOsaQoloT4fO24CK+XjMr9RObvVY0PjCC42Wp
         +ct68Ap5qSpYW3OW74Q1wjMe0zrzkJ4NiqW4suQY3MVT2vZI82isgEnavD6ZlvHv+NJt
         oQ7puMknP9bPhUrWwIL4ZpC1P+sgLBKrWe5NeBs8eS4f+CvFRNxEHpSXCy6PxlGiJYpZ
         sN/+offxpaz6ewVoQIVZEI2EXKpOPoG19+e2nIwnKDudZi9bsAUulTGZrQUmQQb/STkk
         dxkcybY92cRcOzK/6pknxYI+t/5G8DypAD9OWYn9GBOhr6qS5Y8jd40Vu4VxwxOQn+iN
         zwBQ==
X-Gm-Message-State: AOAM530MShIwf1Dch+R2i1/agamR94hf7qYolhE4b0sZrVBlOo2wFv+m
	kOWqbofWqBHtR8QwIT6lzgCQK+1Q+kxqcaIxJaGoBw==
X-Google-Smtp-Source: ABdhPJwk9K7j7K/EeZ6d9lvvaM25bB/d0aQ7YdHx/FDpd0oe1BlGdCt3QWlr4jvoED+Hys6JJSsLcGu2mjZVbWgtPy4=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr15265956oao.63.1654558361069; Mon, 06
 Jun 2022 16:32:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jun 2022 16:32:40 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220606201825.763788-3-pmalani@chromium.org>
References: <20220606201825.763788-1-pmalani@chromium.org> <20220606201825.763788-3-pmalani@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 6 Jun 2022 16:32:40 -0700
Message-ID: <CAE-0n50YQ+ay02DucYb_V3g_Nf_UOoMQC1a=oJasj6kh+ueH=g@mail.gmail.com>
Subject: Re: [PATCH 2/3] platform/chrome: cros_ec_proto: Rename
 cros_ec_command function
To: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org
Cc: bleung@chromium.org, Brian Norris <briannorris@chromium.org>, 
	chrome-platform@lists.linux.dev, 
	Enric Balletbo i Serra <enric.balletbo@collabora.com>, Guenter Roeck <groeck@chromium.org>, 
	Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Prashant Malani (2022-06-06 13:18:03)
> cros_ec_command() is the name of a function as well as a struct, as such
> it can confuse indexing tools (like ctags). Avoid this by renaming it to
> cros_ec_cmd(). Update all the callsites to use the new name.
>
> This patch is a find-and-replace, so should not introduce any functional
> changes.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
