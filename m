Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D85380
	for <chrome-platform@lists.linux.dev>; Fri, 18 Aug 2023 02:59:08 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-689fb672dc8so222855b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 17 Aug 2023 19:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lcfc-corp-partner-google-com.20221208.gappssmtp.com; s=20221208; t=1692327548; x=1692932348;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5ekcZ3MN6GD3R4rBzk1MGa8Dg6eqHF3tAW/7JASPmac=;
        b=Nj7zUUT+2lHtKQwZ6jYZWomjyalQutpum5pnhewepfLaz4K14qkbUxfeVvSwkEXyX/
         2oG2fPzZpGpT13LXPL0Md5X2gTyJCmnLIexcE5AGBJvQPbqGswChLBSvmWT88psz3bF9
         W54LxSKB4z2iQfVDzwQlAKt+/zwz+iJW8I/APitXf7k7DnG0za0t7VHyIHBY2oSdo5HD
         tGfm1VrK0LDw7D/I3MEHm3SDhU9/l/oTC6IJ5w4c9rJE0Jd1IXf5xjMKvL1v7L1wAywO
         cN/J3WqvuXOSjA4O3zkqbZp6NVJqAIJ6RMA67WM1EUpuTi/GImV8fW5niJnAI2bg9LYk
         s4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692327548; x=1692932348;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ekcZ3MN6GD3R4rBzk1MGa8Dg6eqHF3tAW/7JASPmac=;
        b=atC4+HnPq7kD9x7jrQrvUj+xDCUG6XxoSGLZd2xRvCg/pMDxdod6cADqk96pZc94/g
         ysFWMuWhCWurCY6Czm6vl1GwwpfvuHcnEN1p/GYnj0MFzIVq6KOfTHgV4feLzEfTQnNp
         UgGgM5hElJgA5Y8hmmNjiiNpWf43Zoa1YsVPExJGuNWyqnBZHzsh1ldKAhE8B15krPOH
         fHHfNUjpMzgeX36pA+w1S7HvwrmDPR7wDXLNflMh+04uYGNkD/iHoCixbsych+unqWr6
         FouDOHFzwJ0FKMMwWRhWMWQiNRtMLEb17Bgs2N5SQeAU48AuqMQxU7O3k7iNdYlkuYnI
         I56w==
X-Gm-Message-State: AOJu0YzHOtk//sh/guQIqTIO10qIS2DTMDBWtoUc90GnLmkT3dcyN0v9
	ulPhgZRKq3UEkpz9+9HV94P79A==
X-Google-Smtp-Source: AGHT+IG9LTbMpURDFy3azENGjKVk9jT2cQQWjAdfrYQI2MM+h7nUaHacg6HxhgbD3pxN07Hj9XWaWA==
X-Received: by 2002:a05:6a20:440a:b0:12f:a373:ba8d with SMTP id ce10-20020a056a20440a00b0012fa373ba8dmr2386272pzb.24.1692327547719;
        Thu, 17 Aug 2023 19:59:07 -0700 (PDT)
Received: from rasheed-i7-P52.LCFutureCenter.com (211-23-25-187.hinet-ip.hinet.net. [211.23.25.187])
        by smtp.gmail.com with ESMTPSA id l15-20020a170902f68f00b001bdc7d88ee3sm497514plg.37.2023.08.17.19.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 19:59:07 -0700 (PDT)
From: "rasheed.hsueh" <rasheed.hsueh@lcfc.corp-partner.google.com>
To: hverkuil-cisco@xs4all.nl,
	mchehab@kernel.org,
	bleung@chromium.org
Cc: groeck@chromium.org,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	derekhuang@google.com,
	rekanorman@chromium.org,
	Rasheed.Hsueh@lcfuturecenter.com,
	rasheed.yh@gmail.com,
	"rasheed.hsueh" <rasheed.hsueh@lcfc.corp-partner.google.com>
Subject: [PATCH v1 0/1] media: platform: cros-ec: Add Boxy to the match table
Date: Fri, 18 Aug 2023 10:58:47 +0800
Message-Id: <20230818025848.9531-1-rasheed.hsueh@lcfc.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"

The Google Boxy device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

rasheed.hsueh (1):
  media: platform: cros-ec: Add Boxy to the match table

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.17.1

