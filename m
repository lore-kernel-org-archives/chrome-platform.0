Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70823AD21
	for <chrome-platform@lists.linux.dev>; Tue,  3 Jan 2023 23:15:03 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id qb7so7704844qvb.5
        for <chrome-platform@lists.linux.dev>; Tue, 03 Jan 2023 15:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PVUBg/pIJFfQJNDcIKJyTX9Q7jaVPzPZQG2NuyDeClk=;
        b=BSKFi8E62Zr40rIE7PJc3zsmCl3Fs1DHI4RqnuGepfkkSf+fL/tZnkPHMr4cusd5Cg
         K9q9eoRpA65dOPilaZRt133SFGQ7BPesneSb2+mjBosF5GxPFs/24zRDdZPpv/gcwGpH
         xgvkAB/yacPo8wra9s/qfIL9jnMGdGt4uMjH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVUBg/pIJFfQJNDcIKJyTX9Q7jaVPzPZQG2NuyDeClk=;
        b=3UJ9IhNH2/3L8gschhUedKKiUKiqJmwCEiqgTjcWElV6lCGsNDA9F1AhweYNR2h2Ec
         Wx2dWvEB23oh0PJNhgRDR5xKSxZm7+hkvDKMZRIq3x46s+8UfVn78TsGHFCVltYWKZXB
         R8ErktEL7TeXUJ6QrpOPj7l59VNY734X2wmnuzFJpweogqTpN8EUjVsoFhLK3xfCL0cY
         aN5ikuwcXFZFe15r3U/pQaYNEL3GN2SZxvf5AssopSTUvVGfUYrJfI4nAs+xAHvude8e
         DPof76EZDrfEJPldWasx3QhDuEiuYrj7kY7XXFPc+GhZxxPctvc27qFw5b50apuh7Sm/
         hLsw==
X-Gm-Message-State: AFqh2kph81yGjvAmqW9//MJSGbZy6owvp3tH4b391HdHuACR6p74KAlQ
	pWLCsxMks2TtbISNfxHcbcuoZfVAncVIPSlT
X-Google-Smtp-Source: AMrXdXs6yvLGJdiZWNloFzVlJhl207ZyBchYh96By+RQmA5kZWm3xULnV2vZ/nAkl7fk7MgpUzqpUQ==
X-Received: by 2002:a05:6214:8e3:b0:521:ae4d:ea6a with SMTP id dr3-20020a05621408e300b00521ae4dea6amr61471419qvb.20.1672787702267;
        Tue, 03 Jan 2023 15:15:02 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id bm36-20020a05620a19a400b006fa4cac54a5sm22925955qkb.72.2023.01.03.15.15.01
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 15:15:01 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id 192so34806045ybt.6
        for <chrome-platform@lists.linux.dev>; Tue, 03 Jan 2023 15:15:01 -0800 (PST)
X-Received: by 2002:a25:d74c:0:b0:735:b280:6964 with SMTP id
 o73-20020a25d74c000000b00735b2806964mr3274399ybg.361.1672787700767; Tue, 03
 Jan 2023 15:15:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACeCKafGg5=1MQQdCtXDm-3LE2VsixHPsUDngRwQXUvAwQ=u=Q@mail.gmail.com>
 <20230103225204.346088-1-robbarnes@google.com> <20230103225204.346088-2-robbarnes@google.com>
In-Reply-To: <20230103225204.346088-2-robbarnes@google.com>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 3 Jan 2023 15:14:49 -0800
X-Gmail-Original-Message-ID: <CA+ASDXMVDMO4BXuHYDzZwF5OyULCdgxhcLm52Xv43TKKmEHrPQ@mail.gmail.com>
Message-ID: <CA+ASDXMVDMO4BXuHYDzZwF5OyULCdgxhcLm52Xv43TKKmEHrPQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/chrome: cros_ec: Poll EC log on EC panic
To: Rob Barnes <robbarnes@google.com>
Cc: groeck@chromium.org, pmalani@chromium.org, chrome-platform@lists.linux.dev, 
	dtor@chromium.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 3, 2023 at 2:52 PM Rob Barnes <robbarnes@google.com> wrote:
> Change-Id: I622a5e99b8be922f5c1a8004a863cf94a63ac813

Gerrit Change-Ids don't belong in upstream commit messages. You could
either use `patman` (from the U-Boot project) to send your patches (in
which case, the Change-Id can be helpful to patman in constructing
useful Message-Ids, and patman will strip it in the final mail), or
else run checkpatch properly, which would complain (unless you're
using something like `--ignore=GERRIT_CHANGE_ID` on the CLI or in
~/.checkpatch.conf).

Presumably the apply-er can fix this, or else if you have a v3+, might
as well fix it yourself.

Brian
