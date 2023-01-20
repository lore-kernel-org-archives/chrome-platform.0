Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D1633C8
	for <chrome-platform@lists.linux.dev>; Fri, 20 Jan 2023 17:34:23 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id b10so6290528pjo.1
        for <chrome-platform@lists.linux.dev>; Fri, 20 Jan 2023 09:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Qce6k9mwqU5NepWopiJstouIyBahOLCg81PX5JZd30=;
        b=ZPDBONsa4pvvRK5jyivblqdBW+xQdjUEPbjs7JXsNwiVlHcJ3tL3gbywzoJJ/O2uhw
         i7pvVM7hGn+zQTy+0Fg48O1bikjvnNmGGPPn1RDkyBVKC4Q/6wv1kof5efl2WbbMhM2x
         BomDsKoFMuyEsQiOb8Ws0hcri0T0tTPSopg0O1fqjkxrP8U3IbxRrRM3me8hO79pvo8t
         7zMn5NCYQHfnHr1wx8IMdptfIc8zS1IDj1RpRICWKPoLIzA2mOS4vqnezJZXc2EXynhv
         STzsCf+UthobniN2ZlbBOjzy/n6XUq/SqdvgzemVPeAdcMh2LFgVSFfObLmG+5v8u/VI
         TspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Qce6k9mwqU5NepWopiJstouIyBahOLCg81PX5JZd30=;
        b=g/H//GW45ubY3A6Nm983C8iC/0Jlt463RWcw6i7zqMUMCykUYrrxJPLIW3Iov1H5oH
         npZmUGY4tVBgsb+FSVRcqzueCtpf+fHly5T+QOmj9Xijd3CLoX+TpuvP35Dr/PlOzIrH
         jU8cTuGR1HcB8FcJKtZpbxrPBeIIl6WBG9cbYKG60avRV6cBMiZz1aF7Lb4UOEKtZuKw
         L1mlBcjsFHNZhRVPf5rWstBoGuBf1k1ztwuWQYW/IsY+VdLBy2DNAAqTtiwN85PZ5hGB
         qPOIgO4wK5JTmnyuyZYKoQbIBc98XkgYsnX7XqivzgMbLRwtYhslLYbVGQwg6u+8o9i9
         8HGg==
X-Gm-Message-State: AFqh2kqvmr0TAFssNEGVPOGW1IxqS9szXDoVBr8Cqy0tTs/vHnFF9qSv
	ogJwKBu05kPX9v01MaE/qz0=
X-Google-Smtp-Source: AMrXdXsH7iofW0AYixH1DqxtihjqFnYzTUw4bqjfk+uyoNypBz1JULxrgW1Gn+t76PeQxZdIovQLZw==
X-Received: by 2002:a17:90b:1652:b0:22b:b6b0:788f with SMTP id il18-20020a17090b165200b0022bb6b0788fmr1964438pjb.14.1674236063174;
        Fri, 20 Jan 2023 09:34:23 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:3bfe:a22:9187:ed3b])
        by smtp.gmail.com with ESMTPSA id z17-20020a17090abd9100b00219752c8ea5sm1760839pjr.37.2023.01.20.09.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:34:22 -0800 (PST)
Date: Fri, 20 Jan 2023 09:34:19 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?utf-8?B?am9ld3Uo5ZCz5Luy5oyvKQ==?= <joewu@msi.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xiang wangx <wangxiang@cdjrlc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
	Benson Leung <bleung@chromium.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Derek Huang <derekhuang@google.com>,
	"Dustin L . Howett" <dustin@howett.net>,
	Furquan Shaikh <furquan@chromium.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Lee Jones <lee.jones@linaro.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH v2] cros_ec_keyb: Add 3 buttons for monitor function
Message-ID: <Y8rQmxpmf47v7pyS@google.com>
References: <e23628e2cb464d238eb1c33a9e1e516b@msi.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e23628e2cb464d238eb1c33a9e1e516b@msi.com>

On Fri, Dec 23, 2022 at 07:18:06AM +0000, joewu(吳仲振) wrote:
> Add 3 extra buttons: 'brightness up', 'brightness down'
> and 'screen lock' to support monitor manipulating function.
> 
> Signed-off-by: Joe Wu <joewu@msi.com>

Applied, thank you.

-- 
Dmitry
