Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7A12F21
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 04:50:42 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id a32-20020a25ae20000000b0061db8f89e46so2403871ybj.14
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 20:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=YCA6emWktyBXxA2gPoClKmBkkj7whao/y8NEBd3D7hc=;
        b=OqfbT+Z9Zci85vNTvgOBqf+Gk4+iEj1zaPuTbJMQKW7uUwCnJvaoo8JY4p9rCkH+ja
         lJPTj9IyI7xVBZNI3EcrOW3KZzydtRByXyV2o5KSdZCMp5Ctw5BKr5YU5FUZ8s2xvO8X
         3JNDv/+XfQf0ZclxF8UWZ25PSHhnfCDd2C3KXrNu1ZsTtPDeJKuJ3u6Sj2TIHrqmg5St
         cQ8m0wbes88pOYIeLIG/blq+snM4k55Rj3WfUvAdF5hyPcQnkmfFSmzNfla3YSIVK3BC
         fqO3BWBi0nU5AUqN3aZByWPBr7RkPAri/Yh7VPyP7/f03RingjzhH+ABii9AX0el0piS
         h/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=YCA6emWktyBXxA2gPoClKmBkkj7whao/y8NEBd3D7hc=;
        b=0uSuVLndeozMBB5HG4KZteVxA7bN7amxclQwDzEChvjYTcjQM7WxAPDu/kBuw4x8Ie
         OHJpfMUifC9cK0Ksi6XUxTvhWg/10yZ1eyVW4wZXGWZTgdPYPFiM8R9crUwcagUCzR4/
         JAl89uzg/bSVlYQuVNthhqk7+qZZAodnpmb0bMkY42GpSWNEPGE6IQc9woe83behmz6r
         Eot5MIK+mD5NW1eYmSscEuDWZFLDw6YDEPa/XOzlmIis4sZjVJaRmXHXIjztyIfkdiFz
         9NA6hqcYPIVAgFlFA92EJazAekdDWw8J4jLDyohbxKDq2cuLBxyPSXyHOzNkXdTls/fK
         EGRg==
X-Gm-Message-State: AOAM531ebLDI3JaSEkId3rkcgH2PXrEvyIYZmt5Kj1S2G6l8tHCp+Y3q
	k+a5UKanv8tXePzsxNAa9E4IqjHgfRrT
X-Google-Smtp-Source: ABdhPJzHhyUk9Bpnbq9x3oEjDXZN/CYiiGpaXX3cjlmrDaPGqnhNSNhJyWdRW4HIgZPx+RKZvOviisOAaRdX
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:4b6f:f14d:be50:86a])
 (user=tzungbi job=sendgmr) by 2002:a5b:4d:: with SMTP id e13mr576696ybp.314.1644382241753;
 Tue, 08 Feb 2022 20:50:41 -0800 (PST)
Date: Wed,  9 Feb 2022 12:50:29 +0800
Message-Id: <20220209045035.380615-1-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH v2 0/6] platform/chrome: cros_ec: miscellaneous cleanups
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"

The 1st patch fixes unhandled undos in error handling path.

The rest of patches cleans drivers/platform/chrome/cros_ec.c.

Changes from v1[1]:
- Use imperative mood in commit messages.
- Use IS_ERR_OR_NULL() in 1st patch.

[1]: https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u

Tzung-Bi Shih (6):
  platform/chrome: cros_ec: fix error handling in cros_ec_register()
  platform/chrome: cros_ec: remove unused variable `was_wake_device`
  platform/chrome: cros_ec: determine `wake_enabled` in
    cros_ec_suspend()
  platform/chrome: cros_ec: don't initialize `err` in cros_ec_register()
  platform/chrome: cros_ec: sort header inclusion alphabetically
  platform/chrome: cros_ec: append newline to all logs

 drivers/platform/chrome/cros_ec.c           | 38 ++++++++++++---------
 include/linux/platform_data/cros_ec_proto.h |  3 --
 2 files changed, 21 insertions(+), 20 deletions(-)

-- 
2.35.0.263.gb82422642f-goog

