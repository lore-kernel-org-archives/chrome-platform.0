Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9F438DE4
	for <chrome-platform@lists.linux.dev>; Wed,  8 Nov 2023 23:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LskxtY4G"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-41cb7720579so56851cf.1
        for <chrome-platform@lists.linux.dev>; Wed, 08 Nov 2023 15:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699487647; x=1700092447; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cPIgicT0YMUOMCLT4uJCnLIAl30tMcwo5+OGAxGHlM4=;
        b=LskxtY4GAqTvYSQBwUC0+3djQOZXSfoCkrRHlW7dbmsEG/dDQwWus+XkaaFN5DgSG0
         edCsA4Il8xjKLNHxN92IShUP9Ut821XRsJuQJidF2OGnrAnQfQ1V4Fw9nsxkn997ycIZ
         PEZf/OiUNKumgI2bQRGKujP4XgqFjez7OLhjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699487647; x=1700092447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPIgicT0YMUOMCLT4uJCnLIAl30tMcwo5+OGAxGHlM4=;
        b=kwu2kZVXkIXAnPy6qRnzzdmx2I3cLLWchBX6NPq9KwjcPeXPhk83iKTolbdES1FUxy
         TndtUFSgIOuB2mUK+z3KtaPo2i4nA8mZoSJohKl+eJjNEEYOozrylK2UExc/tmJqHAoU
         P7Ero/WsKItdXgLJeNW+99mlSFMUZc5gyKttg0U8SOsuJ/CHyIxAKq3hhSHPpvFic72Y
         +pgazZd03BfCXx5x3Oc29pgE4AQb3oL15Zv3VnqEOitdj2aWxfehdF405xqb6owQ8eke
         lfdMeaF/upTAPnrEgprLKkfg/4IYXzAKdOy287FKdqxETJmwT3vqOfVbfAkyJmUg+Vg9
         kIVA==
X-Gm-Message-State: AOJu0YwBrM1BSspDA0xtS+Buh6ctMw4KdmVM6HSVnKm8dJNXYEIqeyGc
	SKrpy4CgBrWyXfbQgsPwfow7oofNtihZP/VmEgyJBB4wpbVLYTgMty4=
X-Google-Smtp-Source: AGHT+IG4qLX1Jx8SA8MuAgG7xA6Bh7HIssCSJyRn56g2uu3bUzNa7Iw+LteeWg2Y5X9MaR+6Lm//UDZVnVDaFrkoEeE=
X-Received: by 2002:ac8:45c4:0:b0:417:944a:bcb2 with SMTP id
 e4-20020ac845c4000000b00417944abcb2mr119581qto.13.1699487646603; Wed, 08 Nov
 2023 15:54:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231108182625.46563-1-alpernebiyasak@gmail.com>
In-Reply-To: <20231108182625.46563-1-alpernebiyasak@gmail.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 8 Nov 2023 15:53:52 -0800
Message-ID: <CAODwPW8AJuWq5_5Ktb4bo=_2jUgzrUvntdmqh8Pb+bFbq+Txsg@mail.gmail.com>
Subject: Re: [PATCH] firmware: coreboot: framebuffer: Avoid invalid zero
 physical address
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, chrome-platform@lists.linux.dev, 
	Patrick Georgi <pgeorgi@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Samuel Holland <samuel@sholland.org>, coreboot@coreboot.org, 
	Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Yeah, if the kernel wanted to make use of coreboot display init on
those boards, it would have to reserve its own framebuffer space and
need to have at least enough of a driver for the display controller to
be able to tell it which address it picked. Until someone implements
that, erroring out for those cases makes sense.

Reviewed-by: Julius Werner <jwerner@chromium.org>
