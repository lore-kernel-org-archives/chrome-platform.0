Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9717F7F
	for <chrome-platform@lists.linux.dev>; Wed,  4 Jan 2023 01:15:27 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id g15-20020a17090a128f00b0022628a85a1cso4644203pja.4
        for <chrome-platform@lists.linux.dev>; Tue, 03 Jan 2023 17:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fIVffE7jh79Mo6odD78GNMWGDn7q/x/UbQyXfVpvLf8=;
        b=R1mYenG6bwp0GXPiA6n7F6oOHfPw4fabz24w8PTGUrU5AmV+z+/EJt23hf3KSAh6iC
         Mzfp07vdkJ6S6ThqGdmL7iLGr2nQUoiXsfWuKzbRv7xP13gsRlJ2b1mGumBZTfejphW5
         fbUfJbXpo7V0vfhtEsTlfjvpEzQMarcaH/IiWoMC49g6fO34YVVeDtIdU1vSvjfwBGSU
         +d4LIKKwdQwOgnj6/F1slv0h4JYezlvsb4aAgs5njBYeTqUUdwkfYC9n0MD/7R/GlXVw
         dz+glVBZu57and1Pf52njzYn6c8rneZ1KTvqdptIduZsdHpwWfeiHfdiC2x1yyyY5MT1
         /Frw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fIVffE7jh79Mo6odD78GNMWGDn7q/x/UbQyXfVpvLf8=;
        b=7Sf3OfL5flnFBcQ47+BEOqsEqY71zUFjEsU917OTWzZiJf7Peta7oXwnxYHl+c89Xl
         bt4swN9WIEocb89je5TSNJKpIufhYrgeF+VL53c5TxVZujXoJBQFts6XeGB8cZall4+3
         faxBfaZwStp7BCNjvHfBqnhPmRERt7UsSTgHAeIwIm8ixCvkfgXP1TMCNG3P9HggEPR0
         rQg6duxa4L20ERYXWzmkLkhr1N05ICvykBezBR+bgvZ5zDnS1HPQOPjjf/eL2tthAfMw
         QJ9k9+XWwRJ4JoqG1vFtXMQD4GOuisY7GhV/1rpvcPKNzHkYiX56Coi82ODfTeBzU1/J
         QBiQ==
X-Gm-Message-State: AFqh2koQyCXKKRBCNFpgX3blOoS3/CPoiIZjSOP/TurqXvTONH3palEC
	Pg81zv6l1VAGIpgEOKU0E+C7NkmXSj2BV0Q=
X-Google-Smtp-Source: AMrXdXtcM04eoblfgC3LCrdvLPB4rbEBCe8B5GovNelS/DtjLzoOKfv/12/m6w6Vcg/zhZfl5yIv3ojJ/NWYc30=
X-Received: from robbarnes3.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6451])
 (user=robbarnes job=sendgmr) by 2002:a63:2003:0:b0:48e:bdef:b6fb with SMTP id
 g3-20020a632003000000b0048ebdefb6fbmr2155284pgg.457.1672794926930; Tue, 03
 Jan 2023 17:15:26 -0800 (PST)
Date: Wed,  4 Jan 2023 01:15:22 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230104011524.369764-1-robbarnes@google.com>
Subject: [PATCH v3 0/2] Handle CrOS EC Panics
From: Rob Barnes <robbarnes@google.com>
To: groeck@chromium.org, pmalani@chromium.org
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	dtor@chromium.org, Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently the OS ignores EC panics when they occur.
After reporting a panic, the EC will force a hard reset,
possibly after a short delay. This may cause loss of data.

These patches add a handler for CrOS EC panics. When
a panic is detected the OS will attempt to flush critical
data for debugging purposes and attempt an orderly shutdown.

Changelog since v2:
- Minor updates to commit messages

Changelog since v1:
- Updated commit messages
- Split into two patches
- Moved panic handle before mkbp loop
- Switched to dev_emerg


Rob Barnes (2):
  platform/chrome: cros_ec: Poll EC log on EC panic
  platform/chrome: cros_ec: Shutdown on EC Panic

 drivers/platform/chrome/cros_ec_debugfs.c   | 23 +++++++++++++++++++++
 drivers/platform/chrome/cros_ec_lpc.c       | 10 +++++++++
 include/linux/platform_data/cros_ec_proto.h |  9 ++++++++
 3 files changed, 42 insertions(+)

-- 
2.39.0.314.g84b9a713c41-goog

