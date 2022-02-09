Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B587E2F25
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 09:37:47 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id a39so2436038pfx.7
        for <chrome-platform@lists.linux.dev>; Wed, 09 Feb 2022 01:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=D/SNafMJweeOJ08mGtAq65TZOsvcB9+JT1hKzC4LPj8=;
        b=deZn61DcyQI1UW1nzMhOMU0UElI5+irsE14dCSVXNPg8jlgWogyn2mbJstk/yNlZqn
         K9JmSb8Lp7c/bTFgGL082+6HenGMNw3F1RdyTOWy7B69oWPVdXFLwynhu77ZuPcTCqRw
         ZtzA9BkphGqVq7ESyA2xPJnm9JOLGTR+mjkuUriLGo3dwnM5y6P5T/2OBDgQOWzsgv8x
         /5MdLszkOBSSBWNIb3wRIfAxnehyt+L6Jj4pJrLsWV2WjNBCKemIhQeq67ya418E6vno
         fYIvVuNa2tTfBxgabBjmy48vEZOnWZZm64FnuXJbfgBka51hq0P+pxAIaxVpJhZ+LymJ
         DWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D/SNafMJweeOJ08mGtAq65TZOsvcB9+JT1hKzC4LPj8=;
        b=hdjGKt7YoStDAsGIpV2WxzaWWLqaiN+fupRBPr+/sNh2soMuj2dc+wenXU5RHWgiu7
         7w1iAUXTC3J3RX5okBLyw6uWuckfvxVmtRWNpaumnufJLWWWDPdKyLti7qX70CHCa1iW
         oRz0pDs0O0LuVtE7jQBGKUZck9TgF6DGpGltQZHCxUMIjY6ANS3tWSi0PQdNy+jFWosx
         QU8uGZZucBmn19I6VfUt4XeGkvQU0QTYjUf/WM2gzc5wxCgQTk+hxJQzu4YQGGA6rD2R
         P3hHD8Wcmd7zP6o/4OuIkty3C4GpKMicfUb3Lw3ZLprbFb7ReqluPP3AkSSFwgrNU4I0
         oFXg==
X-Gm-Message-State: AOAM532DDFpArYZIWGSSlpuULxEJZ2DdTbT2mT7iQ151RHa4CKaMTCCO
	9R/NxtqapEe/AoevHpwfp/8S+apUmCyHrg==
X-Google-Smtp-Source: ABdhPJzupbZY7WmodrB96WgI8HBjPA63TqPRYpEsYxDVkm2+8tuZuCXo7PJkQnCqKNNpP+oNXwALag==
X-Received: by 2002:a05:6a00:15d0:: with SMTP id o16mr1330374pfu.13.1644399466980;
        Wed, 09 Feb 2022 01:37:46 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:ee29:8b32:75bc:44ec])
        by smtp.gmail.com with ESMTPSA id lr8sm5576937pjb.11.2022.02.09.01.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 01:37:46 -0800 (PST)
Date: Wed, 9 Feb 2022 17:37:44 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 4/6] platform/chrome: cros_ec: don't initialize `err`
 in cros_ec_register()
Message-ID: <YgOLaI+08f8w6WWu@google.com>
References: <20220209045035.380615-1-tzungbi@google.com>
 <20220209045035.380615-5-tzungbi@google.com>
 <CACeCKaeRz2D-DdPRHbrvywTMr2w-MPuGZ+-mBhNtWCapgm=ZXw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACeCKaeRz2D-DdPRHbrvywTMr2w-MPuGZ+-mBhNtWCapgm=ZXw@mail.gmail.com>

On Tue, Feb 08, 2022 at 10:08:59PM -0800, Prashant Malani wrote:
> On Tue, Feb 8, 2022 at 8:51 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> >
> > `err` in cros_ec_register() doesn't need to be initialized.
> 
> What is the issue with it being initialized to 0? This doesn't strike
> me as necessary.

Although it might be optimized out, the initialization is redundant.  `err` is
going to be overridden soon at [1].

[1]: https://elixir.bootlin.com/linux/v5.17-rc3/source/drivers/platform/chrome/cros_ec.c#L203

The patch makes the code concise and reduces the code size (hopefully!).  It's
fine to drop the change if the code wouldn't bother you.
