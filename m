Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5224D29CA
	for <chrome-platform@lists.linux.dev>; Wed, 27 Jul 2022 19:34:11 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id r70so14287803iod.10
        for <chrome-platform@lists.linux.dev>; Wed, 27 Jul 2022 12:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=N/0o0dD/x+CwkyBbvzJIC2K+biUXwEeiHAmV87rToR0=;
        b=cjMfC/aLwYRalhLFQROzJkq6tDQeAQ9DdKKW4zcLv0lhdpLGh6j53ISEFM+S9DCN4c
         leJt+6SW8WtCmfgIQ/fbZ/Y4zerHtwk4Up3th228U431m/guJkLe57il80nM7Vagr7cy
         ihAovbsahVrnUy+0WN3O15aYnGP4rHuaZ4qeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=N/0o0dD/x+CwkyBbvzJIC2K+biUXwEeiHAmV87rToR0=;
        b=xARW8mSZwrbkIjIw1Woo2bnY9IeYYiEeabUs/3xZNRCvjeD1+9QoBI83HhEiYt1xfs
         tSVa+JziEGc19YTsoERvuFy3CMVGH2e+aj8zFjPNuHucHqNJukApgt1UCMNNGNcraw4p
         ValYkVESGExpfeTSwbBhtvSg7+V8OkQoGqOZ4a4aFLQHNF0OPknzxI+jKlwblmWOpC03
         TyX2dmPRmoS+0DzQMLUvdGceNH0/gkJ79MRqkk28T3FfOKvTDF8aUuYGPi/PLkrX4bgs
         pGgN+Hd62By3YMiyRv5zXt6O3Y2MgwAD0BieEdslr7Uol/Qd0s6ATgnWY8DIyNOrii8/
         luLw==
X-Gm-Message-State: AJIora+qeuyuV6j1V0wF0oO1B57JTEltCvML5FM/T00MQ0CeFhLHs01b
	Qpf8Ft7v34VGLIaz7EApe10vwA==
X-Google-Smtp-Source: AGRyM1stnNLMExpZBm4LjSwakLqZM+Npc6FXE7Vl2e/xFGesNUPhIM8s1BjEnAt2bNt+9i92RzUaeQ==
X-Received: by 2002:a6b:c501:0:b0:67b:a949:5edc with SMTP id v1-20020a6bc501000000b0067ba9495edcmr8327777iof.198.1658950450351;
        Wed, 27 Jul 2022 12:34:10 -0700 (PDT)
Received: from chromium.org ([2601:285:8300:c23:7d3c:f486:4e4c:9feb])
        by smtp.gmail.com with ESMTPSA id d39-20020a0285aa000000b0033f07b375b8sm8343087jai.52.2022.07.27.12.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 12:34:09 -0700 (PDT)
Date: Wed, 27 Jul 2022 13:34:07 -0600
From: Jack Rosenthal <jrosenth@chromium.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Julius Werner <jwerner@chromium.org>,
	LKML <linux-kernel@vger.kernel.org>,
	chrome-platform@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>,
	Jack Rosenthal <jrosenth@chromium.org>
Subject: Re: [PATCH] firmware: google: Implement vboot workbuf in sysfs
Message-ID: <YuGTL79tPPoalk/j@chromium.org>
References: <20220726235115.1184532-1-jrosenth@chromium.org>
 <CAODwPW-9UPokepL_VVGuCLaWTDT7hmN9R9Z2yXABrP4g3_N4uQ@mail.gmail.com>
 <CAE-0n51RsN3P5hT+kApw-kPqjm_K7=7bvySWLNdQuQPnrQYZRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n51RsN3P5hT+kApw-kPqjm_K7=7bvySWLNdQuQPnrQYZRw@mail.gmail.com>

Thanks for the feedback.  I will re-work this to be a more generic cbmem
sysfs interface.

Jack
