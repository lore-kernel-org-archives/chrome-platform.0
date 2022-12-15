Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CAE6ABC
	for <chrome-platform@lists.linux.dev>; Thu, 15 Dec 2022 22:58:55 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-3c090251d59so10872227b3.4
        for <chrome-platform@lists.linux.dev>; Thu, 15 Dec 2022 14:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s0UUZcz2M6JUovGJxizjQWESY/vxVUxzAMePTGkmavQ=;
        b=EdSH76dSor7phZGQyOiwpRrYz2IYRV2FrdAcs8yfb2GL43X/HGKqd2Y74yO4xc25Pp
         yrZurNWm4B6wKF+8bBgMl+33nDH2coVPGXm46TNi6eT7YVDO39ctrQTcSMF5qrVrFWYY
         TvShntjwr6bFx3HhLCfu3Sr1oCzQmHxFLqVRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0UUZcz2M6JUovGJxizjQWESY/vxVUxzAMePTGkmavQ=;
        b=Yklyty495igJQRVpMpe8iEP38w1yVM+GTlhcZXjLEE8eKil0A0DKKDWZ6s4/t2sqdf
         1wydii/Gjv2wM+ejftNR09IvQMyHFVbhr+EzoRg6OeNuhh6bug+X8uoEEQlr8BLqnqVc
         cpy+3r1SeTC4iB/vEO6lPZYe6mMHHPTD3/mS5vavLarOtXNP4A+O2ngW5yWACE6jaRgh
         itQjcr3iU7CU2OFUl1dyNpeQRPiBVs2GnWrzdUh84d6KHxe3wG1Xo2vQM8WceA5Be+Wt
         +C6P2vU8Dtkxo8eLtW4/QvwIsMsrnv+Ls7pgyXqmTigCoT2yVRI7I0dJg9oShfinJGal
         mIow==
X-Gm-Message-State: ANoB5pnyiOrjW90EvkIWa8owivngo9JwwkNDP9v4uwOaFOCNQXgXUYFh
	eIGyqp8tH4f2F3GqIavIJCTIa/7UGUzozRWoZYugew==
X-Google-Smtp-Source: AA0mqf6Xuhli+7ti+l4aYdZwyYygJLY0D+mcLV3NEWJ8pbkP3gOxmcy3nkpAnxrwmTp2ZPuKJQFoyTwPxiLz77hRStI=
X-Received: by 2002:a05:690c:909:b0:368:70a8:9791 with SMTP id
 cb9-20020a05690c090900b0036870a89791mr19619784ywb.197.1671145134170; Thu, 15
 Dec 2022 14:58:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221215061550.18993-1-joewu@msi.corp-partner.google.com>
In-Reply-To: <20221215061550.18993-1-joewu@msi.corp-partner.google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 15 Dec 2022 14:58:41 -0800
Message-ID: <CACeCKae01WNKbP8wWONdpbNJQjLWFF67AFay0kwA_zmoaUNVUQ@mail.gmail.com>
Subject: Re: [PATCH] cros_ec_keyb: Add 3 buttons for monitor function
To: Joe Wu <joewu@msi.corp-partner.google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
	Xiang wangx <wangxiang@cdjrlc.com>, linux-input@vger.kernel.org, 
	Derek Huang <derekhuang@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Benson Leung <bleung@chromium.org>, Daisuke Nojiri <dnojiri@chromium.org>, 
	Furquan Shaikh <furquan@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
	"Dustin L . Howett" <dustin@howett.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Guenter Roeck <groeck@chromium.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hi Joe,

On Wed, Dec 14, 2022 at 10:15 PM Joe Wu
<joewu@msi.corp-partner.google.com> wrote:
>
> This patch is to add extra 3 buttons: 'brightness up',
> 'brightness down' and 'leave PC(cros) mode' to support
> monitor navigation function.

nit: Please use the imperative form [1] while describing patches.
In this case, that would translate to:
"Add extra 3 buttons..."

Thanks,

-Prashant

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
