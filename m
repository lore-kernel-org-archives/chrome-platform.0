Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81317E
	for <chrome-platform@lists.linux.dev>; Wed, 19 Oct 2022 07:13:22 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id 10so16148767pli.0
        for <chrome-platform@lists.linux.dev>; Wed, 19 Oct 2022 00:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EnyjSjMTPDF/Pb6YeVmIOmosIRmbklg+er1uHowePjM=;
        b=M/2nNT6vxmqMy/PehkLN5GqCOrb3/5UIA7c5z6j9Gd5h3P8drdvop/7HUZ/QRFuAYm
         GLHDuTkbIFjDZ7B71Ya3yhz8mS96bZs8UZ0D2EWlVTb1Mabt2SNmFxuePMOVGrnHyW/i
         XnaynbXpWf0T1QheZm6Dzkt/Efbn3sUNA7C42HebNE1n7TcOHwmcsuNCtDDNHZQvsJft
         2TGLeVfxQO9luF9zPggvYSlAoBMe9X25/QQMRLn0ogoKWLj3BNbqb7NIRZUiKSEVPtRS
         WiefxBIF0rcJAf3+UqiMg/fTDKDvCALpA68ycybSqr/eTaOo+1yCo7hEtewZhik49gEs
         TXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnyjSjMTPDF/Pb6YeVmIOmosIRmbklg+er1uHowePjM=;
        b=od0Wl+tV8CVHFsd6r57Tv5eDM6rWs00z6w78Tr+a0slOIxXy75k39ZhnhGABI1ZPfr
         dGo8zWndFQq3SkfR1BPheLC35IDGwyvLm3fCdqU9cwu9bpYrk0htA9i2zhtVbdFnOr36
         NzFxwpuFOCPh6LLghXsjf0qii6R4e9lfhSahBwhMrJuMJ0Licm0FVPTr5GFyGuflGais
         GPDTCi1LN6wOYfOco0rAzZDIjGTV/BEEYeBuifYBEQCQKdnS7cVwGauNm86e8i/j08pq
         puIrR2ACBO93rn1XA1oNJyN9TUkHUdpVfRDSATAJm5s1VTS3Rp1qYqqtimdjUqfFEYAm
         fxnA==
X-Gm-Message-State: ACrzQf33bEjYn4BLIX7k6ZJoLRgNi48LcChVapxdNKHLtdAf8iLdauLV
	2uivdDCFQitWqgQnfAHfMFu3lA==
X-Google-Smtp-Source: AMsMyM5sbXMhpZkgF5xNNe6Mz+eM+Qk3hS5U3flg+aB5PfOkOsu5ahhMr+hcqOj9CbbLFtQNYEsGnA==
X-Received: by 2002:a17:902:f682:b0:185:45e8:2223 with SMTP id l2-20020a170902f68200b0018545e82223mr7049130plg.151.1666163602125;
        Wed, 19 Oct 2022 00:13:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l3-20020a170903244300b00174f7d107c8sm10138751pls.293.2022.10.19.00.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 00:13:21 -0700 (PDT)
Message-ID: <634fa391.170a0220.c2098.31dc@mx.google.com>
Date: Wed, 19 Oct 2022 00:13:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.1-rc1-3-g4358a80a5d92
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.1-rc1-3-g4358a80a5d92)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.1-rc1-=
3-g4358a80a5d92)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.1-rc1-3-g4358a80a5d92/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.1-rc1-3-g4358a80a5d92
Git Commit: 4358a80a5d921f57aded94e48179c1ae16684dbd
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/li=
nux.git
Built: 3 unique architectures

---
For more info write to <info@kernelci.org>
