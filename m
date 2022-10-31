Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE60443B
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 22:47:47 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-13c569e5ff5so14673510fac.6
        for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 15:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GBUSFI+VHiFF9npt/hZBaZigRfFySTfJzNUy1BgETY=;
        b=Sk9qUqguwAImZQCkh2lmfngSdvKIV768yp1dexzyeua08Xrd7t3gLj7C1/mYeZSTyn
         r59UglFH7WkdleXskSGehbsUNzANYjB7m4OlJDP/2i7z1kRNnb8SjOlkKXMG6msFS0Xv
         QjS0QPyVbyKA5EUb7igOV4jdZI4Pp1KGn0KCpZIhz3LzKSPTvYh8zVfXx/f32WvJFKZ/
         G+JAPBCHLfZuTyvBjamkCL/+YxtSO8AaFd2L/XI+68baWEWRLzKjvtZnUrzPRcXq8+bS
         hUhiBAb1sPCfQpZ+C+2xR3qUOFiZmjWdccketrHIKwHDqCopV1IXqVzvblbzCQ9SPXyu
         12ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GBUSFI+VHiFF9npt/hZBaZigRfFySTfJzNUy1BgETY=;
        b=pu9cHTEft7WpXrdw3hikyUYkW5J8bOowOPoAA7zFxNMmZYldaRHM2woYjH9Oe5SFlJ
         XDjY1PrOQOYgdsLMe1qxLp+9nxLs4ouAFevHZN3MfExn5u5+G6OB5jlGQFBOMXN2Bm5V
         prfKkoEP3txB2HqqW5icgC9HFOstfsz/gfZ3NYvx1hrcMLivRuevifgr8hf/sxNyOrJc
         jnjT87TansH3Jc+fkjsQrkTlVjpyrjBY6WIQkrgdP8+VIeUo/fdxpg7dfhIXhIfTIDDE
         JdUvOqWPl0CzJp0QTB7lu0OZoZDATU4CMrykEfQar3OkJR0DEYt3U10mfzgtG084y8MI
         EDJA==
X-Gm-Message-State: ACrzQf0HwcrwzcYBIbyaqSbTpsx/hIv7Ty3bxrHKj2xy/kOK4DBDW0Ln
	e66tAq/KgfaafNK3fx9D3rM=
X-Google-Smtp-Source: AMsMyM7xI52y/1LpfYgwTynoDqPWGfcVWkzza+ZkWkyoRaHgebQV9ESvtTQ52GPriNc6mtG8cfU20Q==
X-Received: by 2002:a05:6871:826:b0:13c:7071:5155 with SMTP id q38-20020a056871082600b0013c70715155mr9416314oap.262.1667256466766;
        Mon, 31 Oct 2022 15:47:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a18-20020a056870d19200b001375188dae9sm3654839oac.16.2022.10.31.15.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 15:47:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 31 Oct 2022 15:47:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Brian Norris <briannorris@chromium.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Benson Leung <bleung@chromium.org>, linux-rtc@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] rtc: cros-ec: Limit RTC alarm range if needed
Message-ID: <20221031224744.GA2082109@roeck-us.net>
References: <20221029005400.2712577-1-linux@roeck-us.net>
 <Y2ABnbBGSJGM3gSS@mail.local>
 <Y2AMQAf/nDGLNMcI@google.com>
 <Y2BESUyKX4KJzhQZ@mail.local>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2BESUyKX4KJzhQZ@mail.local>

On Mon, Oct 31, 2022 at 10:55:21PM +0100, Alexandre Belloni wrote:
> 
> The issue with the current patch is that it forbids going for a better
> solution because you will then take for granted that this driver can't
> ever fail.
> 

This is incorrect. My plan was to get this accepted first and then work
with those responsible on a cleaner solution (which is much more vague).
We can not wait for that cleaner solution now. There is nothing that
prevents us from taking our time to find a cleaner solution, and then
to change the code again to use it.

Guenter
