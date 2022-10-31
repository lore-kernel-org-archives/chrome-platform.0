Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415952F33
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 16:42:57 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so16432028pjc.3
        for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 09:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6g3n64WcsjZVHXYVU68pvzZtWqYwSldKDwzmXxyYkJA=;
        b=fA9yAllLtZLJNw2JbRf/dS5uD+i/e+/FarZbYdku20l2kVtuORZy/jQ56FKKwCj82N
         mDJXDXOJCv5Qek98ZrbkDjMgJFpzZPaPkCSs3ndmjDJloEcpNIiTFaeZ78sCspOs0PDf
         +r+zhN5R933+znf6VxuGJCx8ioJiN+53oLpNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6g3n64WcsjZVHXYVU68pvzZtWqYwSldKDwzmXxyYkJA=;
        b=heLUVXthdizN4VcQ5avh8eh3r1MvbpEbuZQ8A8NYGbGcEN/SCQWCXSSviKYWcq0Nnc
         HUF/mhq3BTkGJYeA8HShC28yQwQK9PA9LL/U1KqYMS2HCPNRiKDDArSH7GrpJ+oObqnN
         IDqLJe2DFN4ZQ+RwhZRWTMoHwHtS3zfAZYUNauEylThAy269f8d3+iFFoOOFPLr9zXt8
         AdZkEZ5vQ3EyQPxBDcmtdXPvlmVjSJpOIS4bVy/K9TfvqRNbVszn1CEDxdQv3FE6+4f3
         fKkD0sH6uejOHkLOxXlc/Rx7VdZ3HWj79whyGhBtko4DgZuwTXf/Zy5ToKSUfF8TuGic
         pd8Q==
X-Gm-Message-State: ACrzQf09fbjrHNpHFjY0BCQO1XGG3T3+7Qkz2MPlbPoHpWcDq7bqSujo
	Q3tiTV0aSxLTEIb80mGtYBLh+w==
X-Google-Smtp-Source: AMsMyM6tta40nq8js1+lXIr/1axqWGfpbLfIlkZWbJY2upYOJ/Thil/osd9WGMNz18e1zYsamRJ6JQ==
X-Received: by 2002:a17:902:f602:b0:178:9818:48a4 with SMTP id n2-20020a170902f60200b00178981848a4mr15116183plg.148.1667234576715;
        Mon, 31 Oct 2022 09:42:56 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:cf9d:6561:637d:2194])
        by smtp.gmail.com with ESMTPSA id l20-20020a170902e2d400b0018689e2c9dfsm4654744plc.153.2022.10.31.09.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 09:42:56 -0700 (PDT)
Date: Mon, 31 Oct 2022 09:42:54 -0700
From: Brian Norris <briannorris@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] platform/chrome: cros_ec_lpc: Move mec_init/destroy
 to device probe/remove
Message-ID: <Y1/7DgHiWLqbrDIi@google.com>
References: <20221028141411.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid>
 <Y19VXaB1531V64EI@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y19VXaB1531V64EI@google.com>

On Mon, Oct 31, 2022 at 12:55:57PM +0800, Tzung-Bi Shih wrote:
> There are 2 more cros_ec_lpc_mec_destroy()s need to be removed [2][3] though.
> 
> [2]: https://elixir.bootlin.com/linux/v6.0/source/drivers/platform/chrome/cros_ec_lpc.c#L596
> [3]: https://elixir.bootlin.com/linux/v6.0/source/drivers/platform/chrome/cros_ec_lpc.c#L606

Your links / line numbers don't make sense, but I see your point. That
was a bad oversight on my part, sorry.

I see you're probably dropping the destroy() function, so I guess I'll
send v2 without this problem.

Brian
