Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F223E461
	for <chrome-platform@lists.linux.dev>; Tue,  3 Oct 2023 22:11:44 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c60f1a2652so2560895ad.0
        for <chrome-platform@lists.linux.dev>; Tue, 03 Oct 2023 15:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696371104; x=1696975904; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QWFdWcwaZ07tccmvOmfe9sVqfxtw17L6Xwy81VVH0tc=;
        b=OI/en6YbY3gyENnDPWR2LFiEsEztFy4YS7mzl4K/DT9491Rr8Xvyo7gR9hfWjLG76/
         cv8amx1NE+Z1q8EHY62AxHqfjhcRfiUosK7Aj7vuP7Jf+cJCvVh08LMV8ryepIn+NFx9
         QMnuZ+9fKXy2ozjFbTCudmN1ONZmhlUWzULG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696371104; x=1696975904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWFdWcwaZ07tccmvOmfe9sVqfxtw17L6Xwy81VVH0tc=;
        b=AtgOdR5zr/48L13m38mEcoUMEssTBrYxO0V/ZoUsOSJTGU2bfsKCzGs5QR1ym8wBMH
         i8Zr21ANM8ugFR0wTXymwKgv3/EwgfPmOXpkD2Ki/IXcJTOAVqt5gDS6fFPXfKFU+n/M
         Xwh1j9Hyc1HTFp22JgOYLtYp3hXUX+3A4aq4nz/nI+lXkfI8goA+a7oQqsw5qT9BZS4g
         Ylj5Kg0bC5o5LF+EBcYOJzNGH4QvvC5rIwBRZPOli/IjqHaaWWtJVk2ZBl0Ldnh2UGty
         3Rw3bFHqs9VtQiZdGLGCyx4+rkcP8iYwv5QeewwhBeFvfgTLRNQ5aUxfUcl3SY4y4gGh
         eQeg==
X-Gm-Message-State: AOJu0Yw8dyVOpCL9qyenOQAqau9iJzHqZHPfb6niIzhVZJ6C0TV8EPq4
	lqepfV/5utBX1RIxBhyxgfW8CA==
X-Google-Smtp-Source: AGHT+IEZRfFhNafHK4dA9rjQZdDnW9hSDlrDkVFEx78a8EOt5GKRH36xETfI5Lo6zDgzAm6lbjACVw==
X-Received: by 2002:a17:902:e80f:b0:1bd:d510:78fb with SMTP id u15-20020a170902e80f00b001bdd51078fbmr6299280plg.3.1696371103898;
        Tue, 03 Oct 2023 15:11:43 -0700 (PDT)
Received: from chromium.org (77.62.105.34.bc.googleusercontent.com. [34.105.62.77])
        by smtp.gmail.com with ESMTPSA id t10-20020a63b70a000000b005854f6a6ef7sm1675856pgf.23.2023.10.03.15.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 15:11:43 -0700 (PDT)
Date: Tue, 3 Oct 2023 22:11:42 +0000
From: Prashant Malani <pmalani@chromium.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 0/4] platform/chrome: Random driver cleanups
Message-ID: <ZRyRnq1B0Xcwc2RH@chromium.org>
References: <20231003003429.1378109-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003003429.1378109-1-swboyd@chromium.org>

Hi Stephen,

Thanks for submitting the patch series.

On Oct 02 17:34, Stephen Boyd wrote:
> Here's some random chromeos driver cleanups that have been sitting in my
> tree. I've noticed them while browsing the code for something I'm
> working on.
> 
> Stephen Boyd (4):
>   platform/chrome: cros_ec_typec: Use semi-colons instead of commas
>   platform/chrome: cros_ec_typec: Use dev_err_probe() more
>   platform/chrome: cros_typec_vdm: Mark port_amode_ops const
>   platform/chrome: cros_ec_proto: Mark outdata as const

For the series:

Acked-by: Prashant Malani <pmalani@chromium.org>

BR,

-Prashant
