Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839187F
	for <chrome-platform@lists.linux.dev>; Mon,  1 Aug 2022 22:15:12 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id a11so6405050wmq.3
        for <chrome-platform@lists.linux.dev>; Mon, 01 Aug 2022 15:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=KkS9Qo1VRpPLirdZBp9VDugwC30AD643a3KZCtTbTTDZ2iNVscA62kiy0dD3sT/JA+
         7ktfkcoT8qRyRUqJX6hl51/je061gXw/lQ5tQwM9iGVRFUd0gwFkUT3u8oFIo7TZtLjf
         Hzp820QgI96oq4m8izWoEwEeHz+f1SPSAyggY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=VjBRmLbuS497L6I+uAgNcyATEc7Vl91LAIIuIj2ATb1QOxnVPS/oHciU9inQ6tehUb
         dT33aMoFbI4ssRB/Rg+T/nV+dEYaPE8K7pIVND8TKQQgXlO5SKneXC4rpCzW91SxASgI
         Mkw9BGLIKaaC0aQKy/sVMaOnNVrHJFs3uu4nl4COEC/Q74lPa16CbtC7DFE0QIbNy0kG
         /q85RIpEO55puPG3WizCc5yfyUdVFNre6H5OcitN7VZfoRn5/+LeCmwTk3Qx3buOUc6q
         lj4x2jL/kmRFzQUTFtoMAK+1sitZfJfWMByP9MuWKiR4L5L8UUtX52wCYnH8gxn2XODH
         Ku3A==
X-Gm-Message-State: AJIora9PZ+BU2q3YTNXupyjSOqTdZDQL1F5UTTvBHk/ZycCDUSUeMLlR
	1M7TkY+0aZgYZhg04I588s4JYEqWxlU/WUbcXLDajg==
X-Google-Smtp-Source: AGRyM1uQtrzzjUTojOce9U1oX4IsLxvEDUtIv9q2DYoehp2Cz8DNp/0ZgjDCAXuc2VNtxvwbNE2CcUP0j7S41z9MIjg=
X-Received: by 2002:a05:600c:3b29:b0:3a3:1fa6:768 with SMTP id
 m41-20020a05600c3b2900b003a31fa60768mr12078307wms.193.1659392110731; Mon, 01
 Aug 2022 15:15:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202207301713.q4988FIe-lkp@intel.com> <20220801152612.3064269-1-jrosenth@chromium.org>
In-Reply-To: <20220801152612.3064269-1-jrosenth@chromium.org>
From: Julius Werner <jwerner@chromium.org>
Date: Mon, 1 Aug 2022 15:14:58 -0700
Message-ID: <CAODwPW-eQ-dYvfCGZ13tOzh4gPdLU9ZoFg9joWpRTX22OXa4Ow@mail.gmail.com>
Subject: Re: [PATCH v5] firmware: google: Implement cbmem in sysfs driver
To: Jack Rosenthal <jrosenth@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, chrome-platform@lists.linux.dev, 
	Stephen Boyd <swboyd@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Julius Werner <jwerner@chromium.org>
