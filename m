Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2468F7C
	for <chrome-platform@lists.linux.dev>; Tue,  3 Jan 2023 22:52:07 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id z10-20020a170902ccca00b001898329db72so22951660ple.21
        for <chrome-platform@lists.linux.dev>; Tue, 03 Jan 2023 14:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lG4GSVPbjg+6U6nGDmBr4/cfFeVVwkYozm8u2Z4QFR8=;
        b=gDl00iEY6WWQAc8JiShg0Ng+nb4TV3ozXdLxE8aVKFy1HzNo+S7pCjiHfiZRsh0rPK
         AV7GiiXI5fOElC/pi/GRcvcfzi5hEYnWPfFCDqGTs4Lp3QgR/STeZWmBjnthyKGMlCBq
         YFPGJxl0OLWIFHVtuCpPF7dtFs7yLzpknsb2ZYfXENz6bcoj/5JDe8Ccxs0UKkX5/SWa
         mzDlRaNWJHSYZJVzTtgwhh14Kg0m8K+qGEYxbh6IFlEUnTcEUu6p1NPNXn1uW07PXJPO
         De6sEWf4iegLlO5c0Ol5W4cdNy3t9hettSkcy/uvr34b+9ql0MRo6Xk37A5MXWns6hhp
         2Y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lG4GSVPbjg+6U6nGDmBr4/cfFeVVwkYozm8u2Z4QFR8=;
        b=BYfkMOn5pZrdJvnpMYfza9br21bM/yIfDGt/SPjwq9pSpmaNUfO2W6rbIwLBa5cURK
         85aizlwQfMYIN2HsDIyK+4RrBelu/6xaOEQmMUw/zR9iWlcU/RyS/R+xsDBi5Ncg+vWQ
         Hz2usDrE5fE7RU7cHgUK6yHhk5G+sYdYKOd2IAZr7Y38n7/oMgru+tRNOsKaCyIUIC6J
         33tbEWX0JW5TL72zk8jsI/B96N9Uw9b3Lfo88zrwoJWn0uHs876Vlj4fp7+PIHYJkq5V
         a45AWDPGqPUfvFqAoRnGXcRpVkob+dMF068x750nD9lsQHj2eNHXwh6iXENoJ6s4+3Mn
         u3Ww==
X-Gm-Message-State: AFqh2ko7R/hEpTngJT3hrfnBpHB4iJQaMvbHj/mnLlFgJ0iwvFqPDXOe
	USGJq3pJN6Z2MY4illAfVn3PURITfFzA3cI=
X-Google-Smtp-Source: AMrXdXuRw2ra6Og46q8Kx34smHMcVfzI1kvUw6VscH2g1c7hiXQv6O4gh8SnwU0lpx4l5mNGGDfX5PvyiqBpPPw=
X-Received: from robbarnes3.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6451])
 (user=robbarnes job=sendgmr) by 2002:a63:24c4:0:b0:499:c23c:d65b with SMTP id
 k187-20020a6324c4000000b00499c23cd65bmr1559819pgk.541.1672786326943; Tue, 03
 Jan 2023 14:52:06 -0800 (PST)
Date: Tue,  3 Jan 2023 22:52:01 +0000
In-Reply-To: <CACeCKafGg5=1MQQdCtXDm-3LE2VsixHPsUDngRwQXUvAwQ=u=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CACeCKafGg5=1MQQdCtXDm-3LE2VsixHPsUDngRwQXUvAwQ=u=Q@mail.gmail.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230103225204.346088-1-robbarnes@google.com>
Subject: [PATCH v2 0/2] Handle CrOS EC Panics
From: Rob Barnes <robbarnes@google.com>
To: groeck@chromium.org, pmalani@chromium.org
Cc: chrome-platform@lists.linux.dev, dtor@chromium.org, 
	Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently the OS ignores EC panics when they occur.
After reporting a panic, the EC will force a hard reset,
possibly after a short delay. This may cause loss of data.

These patches add a handler for CrOS EC panics. When
a panic is detected the OS will attempt to flush critical
data for debugging purposes and attempt an orderly shutdown.

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

