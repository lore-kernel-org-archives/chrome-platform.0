Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17E81360
	for <chrome-platform@lists.linux.dev>; Wed, 21 Dec 2022 02:58:36 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id r18so9547802pgr.12
        for <chrome-platform@lists.linux.dev>; Tue, 20 Dec 2022 18:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NRw+m8nNjXYtJqRDkMvJhQtNbIxdEmEHtQugBvnugPY=;
        b=f/gXfxm5Oos3aftCC/BicSJ4DTs7zXIHePDBtL0Xjh5C3kKjeE9oKRylTWmSO5EUPQ
         PTkF+i1WG//8NTXPgBZLCSFBnulr1j10EIIYCnjDqzlUt1NjVqleqkIGqCKyLbiR/xCz
         9lYjh8TXgh54wSwbmytYBd+AlX4ifGY1CcuQszDHY42jx7aFFvk9U5sDTtaonQEL3OxO
         VmwGzBuEBbCY8e1VXed5/IabpuOUxQ45QrW/6nHpYme7XOjij6d/3mWHpHL2BK8DaI/h
         uLU37GYH48xMo8QxKVQoKcLHfvhMGDlL4YlwNUlGx4qe/gPdm7AGG87qWi3JqxHeihqy
         0KbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NRw+m8nNjXYtJqRDkMvJhQtNbIxdEmEHtQugBvnugPY=;
        b=tDyr9+t+FLEz+JhHzDUdgMcHocDWMwuyV0Xn3M42JZ59Pxyts0djXVFmaUWORRRZUV
         F5oJonxYdW718qNyhmm4h7PFl40GDSYgbBcApeCarOUi8nc5Ke8Tqm7CYEWemHIsZKY7
         TMCMfp5N824GzgRyZfwX77ZJ1wGJkv4bbKPeImxW+1drOB5cpu/g4YCIohIN9oESh8PS
         uRnESK9zfIYpE1rAyybPgwAJ3H9l5QpJkzatdH3GHPQOiCnXotjUXckqjK15gebO1VmO
         oQKm6hXofacD7AD+HpxO1XgT/3titg5XbTLvMY8XUieWLg8+SacTTNnOhyt1Db/xPAXs
         tJOA==
X-Gm-Message-State: AFqh2krFNXnAXFjJFBY8tHa5nmcHoCLNAo0midhgbDQMDToW/MVwpQaf
	EMQj3QvbIpCJ3fzf4O8pZX8Otg==
X-Google-Smtp-Source: AMrXdXtC8On6ZvwiaEaSKPweU6RM41vuTK4l6tbFI2Bi0TVJyRJwWM1PLc6/iZhrox3aifkuYi+s6w==
X-Received: by 2002:a62:2fc4:0:b0:576:d50b:7e6e with SMTP id v187-20020a622fc4000000b00576d50b7e6emr737339pfv.27.1671591516191;
        Tue, 20 Dec 2022 18:58:36 -0800 (PST)
Received: from ruihai-HP.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id g28-20020aa79f1c000000b00574ebfdc721sm9636793pfr.16.2022.12.20.18.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 18:58:35 -0800 (PST)
From: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
To: pmalani@chromium.org,
	bleung@chromium.org,
	groeck@chromium.org,
	knoxchiou@chromium.org,
	weishunc@chromium.org
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: deferred probe when typec count mismatch
Date: Wed, 21 Dec 2022 10:58:32 +0800
Message-Id: <20221221025832.26391-1-zhouruihai@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221220055954.11197-1-zhouruihai@huaqin.corp-partner.google.com>
References: <20221220055954.11197-1-zhouruihai@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

> I think that is problematic. It might as well be that nports >
> EC_USB_PD_MAX_PORTS.
Yes, you're right. so we should consider it's a invalid argument and return -EINVAL
if nports > EC_USB_PD_MAX_PORTS. right?
> Is this really seen in the field ? The EC should never report a wrong
> (random) number of ports. If it is not ready, there should be _some_
> indication that it isn't ready. Does it really report a more or less
> random number in this case ?
Yes, I saw this on corsola boards. The EC report a wrong(not random) number.
because corsola emulates HDMI MUX over the current type-c mux stack. The ec has to
fake a type-c port to pass the MUX info. But the task are not initiated on starting up,
and increase the type-c port counts after the tasks finished. In this case, I saw
the typec->num_ports = 1, but the nports = 2, which will be probe failed and block
the HDMI MUX function.
I will send v2 patch, if nports > EC_USB_PD_MAX_PORTS, then return -EINVAL,
but if nports > typec->num_ports, we consider wait a second to ec task increase the
type-c port counts if there're HDMI DB attach, then return -EPROBE_DEFER.
