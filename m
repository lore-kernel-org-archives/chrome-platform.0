Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8002F33
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 16:45:59 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d10so11156692pfh.6
        for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 09:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EWfpdNndb6y+1io6tg307BIA8/DAc2U/fwMy0fmTOdk=;
        b=BpFCKGpAXyOqPgJIfo+H7z6TEq9VgQQRq+L5qpDHIequrzZFaRUjtTCDQyN1ecA3Rk
         S/dAReRmEEY8Z8jDP+M9j/335nrbBMo55k1cZI00tQ6+f/8aLT7a/g9QjarJfMLkWVTQ
         UjYmXP7kzudtdobyf11/aNwGmAa2iScTeHCOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWfpdNndb6y+1io6tg307BIA8/DAc2U/fwMy0fmTOdk=;
        b=e0Ix4Xrjq4psebadG8dSd6OkbPjH9hFDdeD81Pv5iGJNmyKUN75sCVfEZVv/TpUQbK
         XMeLYNf3+JlOgqZ8slg2imtYonTRcbVkwmNBw2dB3WP/NZiz9mNe5JDyhf6bk2i3u86V
         EtH3Shp62H9p8Mv7ayHCJ8fsX2Uft9vXpJAufcDUs+yWn+ThiZVe/HMrxbFi0syMuutc
         zOMWPApmv8xOXdgll5ySB20cjh7u69a7ELvdAZzOgR+wWKnOVjkQ+ShcgaO1XvV2dd8X
         Iv1fm7RqIQlrx392Y/lKPma+ge5mv7723o1cBLeVSnQ7wBgWSqtFXdG0BdKpXrw7HRMM
         oNOA==
X-Gm-Message-State: ACrzQf0L4IB/SRuoVZSp27KfvsGUCnYRfKcwRAx8DTzFy5pWfk2Hrcq4
	TPjY66RTCY7y4+GZ2j8P2BShww==
X-Google-Smtp-Source: AMsMyM4vgx7CsomtQBLUkxDzs5H4DS9Ei8KFC+SuJ2AG4J8uG5bGP3sEebnnF2K02z1qU5HxUbm71A==
X-Received: by 2002:a63:8a42:0:b0:46f:5804:8d9e with SMTP id y63-20020a638a42000000b0046f58048d9emr13620011pgd.214.1667234759374;
        Mon, 31 Oct 2022 09:45:59 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:cf9d:6561:637d:2194])
        by smtp.gmail.com with ESMTPSA id iw15-20020a170903044f00b00177324a7862sm4699501plb.45.2022.10.31.09.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 09:45:58 -0700 (PDT)
Date: Mon, 31 Oct 2022 09:45:57 -0700
From: Brian Norris <briannorris@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc_mec: remove
 cros_ec_lpc_mec_destroy()
Message-ID: <Y1/7xWZDeReB7twh@google.com>
References: <20221031050657.3899359-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031050657.3899359-1-tzungbi@kernel.org>

On Mon, Oct 31, 2022 at 01:06:57PM +0800, Tzung-Bi Shih wrote:
> It's pointless (and invalid) to destroy a statically allocated mutex in
> cros_ec_lpc_mec_destroy().
> 
> Let's remove it.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

This whole init()/destroy() thing hiding global state is kind of weird
in the first place, and if this ever properly becomes non-global state,
we might want to have a matching destroy() API back. But for now, this
probably makes more sense.

(Alternatively, one could leave an empty function. But I think that
might hurt someone else's sense of style.)

So:

Reviewed-by: Brian Norris <briannorris@chromium.org>
