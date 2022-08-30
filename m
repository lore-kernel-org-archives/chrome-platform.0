Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BB96131
	for <chrome-platform@lists.linux.dev>; Tue, 30 Aug 2022 22:58:34 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id mj6so7456609pjb.1
        for <chrome-platform@lists.linux.dev>; Tue, 30 Aug 2022 15:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=19gKfO2YDbR1tWt1JPXALLMo6GyTndA+o+AoPOLFBAs=;
        b=cuBC6/5JrePt4mhJwmjB8G1ozut0+vlf2xAHpQSwWj9zRxbFHMMhFKL/8Qv5I0z9Ec
         mIhgGk99Tpt9MXjTxh2SvzCAvuyLxzK9AL8lkILTWZc1hZLy4RbiFwPW8P7qPTOjDa9N
         FCon6w5dPmosnUNTDoa2i7YYBPM0403jlqK3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=19gKfO2YDbR1tWt1JPXALLMo6GyTndA+o+AoPOLFBAs=;
        b=ccrozrxiGWux9Qc6UW8zqjHzccYDrwCPbV/R5OofT6gYFxdIBQMORD3GLL0CT+nVaL
         N3rwKvlBh6huvO1AEaXwsbAFeTfoSccKBD6xZzZgcmJf8vPDrYQfC27q4x7t3gWDaXEp
         17sL2rNTcl/4yfCRzfFbbrSdBL5qdmwo9Q4dj56KyKrb+9TrMzlW02buualgXzosbIYO
         7DDXL0cyI4ibh8pj2EwbUjmNY80ICuCGnfMvH/xtQtUqssmDYdcNW4XY9I8333m+ZfOs
         WMloZj8eLm30BjSGYDz1+UAzz3NnQAgb2Cd/wyDwtcjudx9Py8HYozfqSIfTSA7Ry6Zi
         LC+Q==
X-Gm-Message-State: ACgBeo2YBDsuoaDTvKZrZNtxT0/cupTSnC0IxZGz0rfNO1jgtFEn7Pay
	QhGCk6d6Ta4FZQX1pIU3S65UHg==
X-Google-Smtp-Source: AA6agR7FX/ULITnzjbZuJ8dxIpYtuHEfPjEMHXQv0zaQxxGVpiyL6dIVjMuXdVDc3x962k1HOIh3jg==
X-Received: by 2002:a17:902:db05:b0:172:f759:f99d with SMTP id m5-20020a170902db0500b00172f759f99dmr23137940plx.76.1661900313631;
        Tue, 30 Aug 2022 15:58:33 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:5f34:2f6:2856:188e])
        by smtp.gmail.com with ESMTPSA id bf3-20020a170902b90300b001743be790b4sm10083539plb.215.2022.08.30.15.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 15:58:33 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH 0/4] platform/chrome: Minor cleanups to cros_typec_switch
Date: Tue, 30 Aug 2022 15:58:27 -0700
Message-Id: <20220830225831.2362403-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A small cleanup patch pile for the new cros_typec_switch driver.

Stephen Boyd (4):
  platform/chrome: cros_typec_switch: Add missing newline on printk
  platform/chrome: cros_typec_switch: Remove impossible condition
  platform/chrome: cros_typec_switch: Use PTR_ERR_OR_ZERO() to simplify
  platform/chrome: cros_typec_switch: Inline DRV_NAME

 drivers/platform/chrome/cros_typec_switch.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)


base-commit: 1a8912caba02522f612d465a4849ce98915b96ad
-- 
https://chromeos.dev

