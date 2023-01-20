Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E5333C8
	for <chrome-platform@lists.linux.dev>; Fri, 20 Jan 2023 17:24:24 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id b17so5909856pld.7
        for <chrome-platform@lists.linux.dev>; Fri, 20 Jan 2023 09:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lXHFUqYMA81z5/4QWzsBDmmfnfiAGwft9ib/dJiqERE=;
        b=Q6KlvDHcgN8LTA6RPXCIlBvXcsrxe8XHEyB7D4zJb1fuySw35C3PC+7cC07gL2DDpE
         ztum/4dfo2nFbVBbhcIUGGDKWpHv+8Y6tEPrKp56E1jOC1z5yFA+3n1lXxvp+I5R7OIF
         m93LLV4A38DJglYnRYeCYG2J3b0xV+I2S4tW7/oLyaWrmqZRttuEkmQjr5EnaCEEY9iH
         B9BOAqxsUy47OUOdZ9F9ts61W0WLCstD3a67/bi8ScuH5/1JDS+ilKGCBkoivSpQPQlu
         OyfqB8DG+fBqg6CpeLG7PaOPJf/W/wfVlNWSK/cvYv/tIqEPMn6FsA73HVcWHpoveeVp
         jFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lXHFUqYMA81z5/4QWzsBDmmfnfiAGwft9ib/dJiqERE=;
        b=1X8senzSIkCzA5PNzbEwQ6goDimfuhubscrudfABL89vYtqDZya7C5RpmH0JG2htDH
         I9cqckW3fjN4+kGrRuV6yCMEFGCbGQUxg6kM0OL08hEQPW/PGLRqOMvuHaF+CbRLCWhT
         pVItfiG5cx9vvRKXHaIhT9NJmZGa8vlWwoQt2Z+WPLtM6al/pBBB3ktrGaePYlRuBl0a
         Py9nvqRBDSYpjCI+C6tyNHmCU4IjNPeKnIGvd/KA09I3lpR34uxj+fKuSUY/C4AL1uid
         IoaVMkDGAcLSnUFVN9u0MIa9i3PGghKkJrLPbI59DQl6K883vizuyk82a3JnAJNglgdc
         rL4w==
X-Gm-Message-State: AFqh2kpm4iGGfUxMPh7eWJz5hgDgrhcOywf+aSdGir21lBEO1vGR2JHy
	phhrexKzk1n6ue8/NVAq5K4=
X-Google-Smtp-Source: AMrXdXsnPAfV/Va8Ok5ZiLV8eE3SVtsOmVIwYH5OdnJv7qLEIq/eyq1QteagJINpb0N8yv3z+FkX6w==
X-Received: by 2002:a17:903:1c6:b0:195:e590:c7c6 with SMTP id e6-20020a17090301c600b00195e590c7c6mr4003519plh.22.1674235463163;
        Fri, 20 Jan 2023 09:24:23 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:3bfe:a22:9187:ed3b])
        by smtp.gmail.com with ESMTPSA id m11-20020a170902db0b00b00186a2274382sm27330649plx.76.2023.01.20.09.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:24:22 -0800 (PST)
Date: Fri, 20 Jan 2023 09:24:18 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joe Wu <joewu@msi.corp-partner.google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>, linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Derek Huang <derekhuang@google.com>,
	"Dustin L . Howett" <dustin@howett.net>, Joe Wu <joewu@msi.com>,
	Furquan Shaikh <furquan@chromium.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Lee Jones <lee.jones@linaro.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH] cros_ec_keyb: Add 3 buttons for monitor function
Message-ID: <Y8rOQqhWcVAv8gmN@google.com>
References: <20221222063950.26018-1-joewu@msi.com>
 <Y8p6THz2jjKEoMrJ@kroah.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y8p6THz2jjKEoMrJ@kroah.com>

On Fri, Jan 20, 2023 at 12:26:04PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Dec 22, 2022 at 02:39:50PM +0800, Joe Wu wrote:
> > Add 3 extra buttons: 'brightness up', 'brightness down'
> > and 'screen lock' to support monitor manipulating function.
> > 
> > Signed-off-by: Joe Wu <joewu@msi.com>
> 
> From: line does not match the signed-off-by (and is an invalid email
> address...)

What do you mean "it's an invalid email address"? You can definitely
send emails there... I prefer people not to use Google partner domain
accounts in the hope that their employment might outlast their
involvement in Google projects, but that is it.

I think if we ask people to stick "From: <whatever the company address
is" in the body of the patch we can ignore the difference between sender
address and from/signed-off-by when they use partner domain accounts. If
anything, such accounts have better vetting than a random gmail or other
free email service account some vendors have to create to be able to
send a plain-text emails that we require. I mean, we have
"Signed-off-by: George Spelvin <lkml@sdf.org>" present in our git
history and nobody bats an eye...

Thanks.

-- 
Dmitry
