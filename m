Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35D817F7
	for <chrome-platform@lists.linux.dev>; Fri, 20 Jan 2023 11:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2EBC433D2;
	Fri, 20 Jan 2023 11:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674213967;
	bh=czey6y6ge6i8PpchkR+ialrlhv0lQLub/JmVU3BLNzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pNyYuyAWBMaeiv2L1KegX6HDQfhQRjd3BuSvKeZIJZN2sJRyh42oF4b8eyOLf/+Jk
	 opSDBf7um0d0cxwLSfLBo+8viJGJx4i6tHK7jVXWhAyHuRLUJVP3wyp599Ans+bcoR
	 pyF/mmLG7MJHKM7s4ysxR/DQeJMMK2ZwgAS9FRP4=
Date: Fri, 20 Jan 2023 12:26:04 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joe Wu <joewu@msi.corp-partner.google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Xiang wangx <wangxiang@cdjrlc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>, linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
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
Message-ID: <Y8p6THz2jjKEoMrJ@kroah.com>
References: <20221222063950.26018-1-joewu@msi.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221222063950.26018-1-joewu@msi.com>

On Thu, Dec 22, 2022 at 02:39:50PM +0800, Joe Wu wrote:
> Add 3 extra buttons: 'brightness up', 'brightness down'
> and 'screen lock' to support monitor manipulating function.
> 
> Signed-off-by: Joe Wu <joewu@msi.com>

From: line does not match the signed-off-by (and is an invalid email
address...)

Please fix.

thanks,

greg k-h
