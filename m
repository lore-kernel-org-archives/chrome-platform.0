Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8181B4129
	for <chrome-platform@lists.linux.dev>; Fri,  6 Dec 2024 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733476519; cv=none; b=d6OY4LIPHSncz4EUmMpqQqZGhYhiztjjlN0t5wkbO1TleGJdVqtQlpcLGwbnANfkVoyuxCMg50Qv12Z3WcLKqnfjRC/c03fiizxGf58rG1fPsBsszdt/nw1vuTzHzPDjUosGukwBUSiGI3fJXWPWqR4V2oM/TanvLoUyjzmctKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733476519; c=relaxed/simple;
	bh=kwLQ94HldbNV+zoGi96XcRdLo7pMGV6re88/hBpXZLc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=kank5RVE9o7I3w4Pj2KzZBe06wAN+IxieAXhO0xcoWPGnzAMs3vlqrJv8jWOnkYILwJxs8/xopxOUCEiZRqkzV3zKaIs9g0K7vIVeFRohECmZlyFc4xvyN3iU4IHtjSt0XdBG/lhpHo7lNNchb1qj67ld87essszAdEIyRXzFLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dawidn.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h901sbgx; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dawidn.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h901sbgx"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-434a96889baso11081335e9.2
        for <chrome-platform@lists.linux.dev>; Fri, 06 Dec 2024 01:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733476516; x=1734081316; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jsoePWe67thrZkp/6OayojgRdEJ0C3zRr215WDhkRnY=;
        b=h901sbgxLKhAdXXBCHTWFyqlNuSXNRAllYAetFGYQtu8n6mhfhkMVs1SPKxsjCFuWc
         Sd+vAc+CnQpcs49Afv+L4BeqIw+Nv3YMEmWoQyy+zghQAxatVeWSSmXl9r/gNqmxqskA
         oMYyq1DUNLRoDp3Nho0XJh+kbXqA6qOCl6nv6AFF6pyshjWfZNAD/05BO+0bZNzvzxNs
         sHOVpvPkLQ+9pdkLAjAnDXJvCtktPX9gk29bREaQiBdhmrJZmJ1O5pVgNKN0RQmMXpOq
         K20KnnGvhhkGZXy875/cdZp3IfLMiED0ii3FEWHmqhF/tSmtQFwhI951qxm7209Hbp57
         BfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733476516; x=1734081316;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jsoePWe67thrZkp/6OayojgRdEJ0C3zRr215WDhkRnY=;
        b=Fwmb6+HBoFKZEfNNv02TowA3HMS7JO3RGtmMbIBQtKVllOj7cK34ekMcbG55nmhDxI
         lPD3gchgbvN5A5B/KEu+OaxYiXCdA0Q8Jsp4++YRGMrXgfVn99ni+d+9mhzXC53rzjEF
         GeON4lbc6DR0UEQybe+v5qD3v/ppLmKEpJMd9e7aIfQc3UpNbEthl6f3s9/M2TepaqvS
         7vXhUGsKhxVqMadbwDntzgqs+A/ZyQEQLkCe3abWSUpd2esA1yzLOwJfj8vMukFBF+8C
         0bhmDGPlHTEebXvD1NY82KSrt5irqVnQFCqzwQL+6UW8ANNfj9Iiy+zmPfJjX0cQPa1X
         mMsg==
X-Gm-Message-State: AOJu0YxF3eJMVjMjgWdjamlsjya59VKhovekBL9CK3gYTSJ3taNkPcq9
	7QO+4Bg9/0HkdAyf78D7G3VpwF5eQKHQ1WAsAgpMQS/0R7iha9h2oZ6QNurofDmYSIUc4M2sxQ7
	ptw==
X-Google-Smtp-Source: AGHT+IFCqv27QWLPM8WTuZZN1s5jBLpaR3DtkRQJGbaid+28O3WxtjoIsfDdFZ897dBjYG2yg8zLySTJhQU=
X-Received: from wmsm5.prod.google.com ([2002:a05:600c:3b05:b0:432:1c3:8b30])
 (user=dawidn job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5799:b0:434:a4b3:5ebe
 with SMTP id 5b1f17b1804b1-434dded7708mr16924935e9.24.1733476516366; Fri, 06
 Dec 2024 01:15:16 -0800 (PST)
Date: Fri,  6 Dec 2024 09:15:12 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241206091514.2538350-1-dawidn@google.com>
Subject: [PATCH v3 0/2] platform/chrome: cros_ec: improve probing for RWSIG
From: Dawid Niedzwiecki <dawidn@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>, Benson Leung <bleung@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, Dawid Niedzwiecki <dawidn@google.com>
Content-Type: text/plain; charset="UTF-8"

V2 -> V3:
- Move exiting from `cros_ec_rwsig_continue` if `error_count` exceeds
  `RWSIG_CONTINUE_MAX_ERRORS_IN_ROW` to the `if (rev < 0)` statement when
  `error_count` is incremented.

V1 -> V2:
- Use dev_info instead of dev_warn when cros_ec_rwsig_continue returns
  an error.
- Return immediately from cros_ec_rwsig_continue, if the RWSIG_ACTION
  command fails itself, not SPI transaction.

Dawid Niedzwiecki (2):
  platform/chrome: cros_ec: jump to RW before probing
  platform/chrome: cros_ec_proto: remove unnecessary retries

 drivers/platform/chrome/cros_ec.c           |  5 ++
 drivers/platform/chrome/cros_ec_i2c.c       |  3 +-
 drivers/platform/chrome/cros_ec_ishtp.c     |  2 +-
 drivers/platform/chrome/cros_ec_lpc.c       |  2 +-
 drivers/platform/chrome/cros_ec_proto.c     | 69 ++++++++++++++++++---
 drivers/platform/chrome/cros_ec_rpmsg.c     |  2 +-
 drivers/platform/chrome/cros_ec_spi.c       |  2 +-
 drivers/platform/chrome/cros_ec_uart.c      |  2 +-
 include/linux/platform_data/cros_ec_proto.h |  2 +
 9 files changed, 74 insertions(+), 15 deletions(-)

-- 
2.47.0.338.g60cca15819-goog

