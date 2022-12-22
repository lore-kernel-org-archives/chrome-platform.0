Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FF31FB1
	for <chrome-platform@lists.linux.dev>; Thu, 22 Dec 2022 06:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B93C433D2;
	Thu, 22 Dec 2022 06:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1671689277;
	bh=oX2ZGdFDzj4FJL8YtBrxlE/UFeg6tZgxNWfiDYAlXm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pmjEUW/c+SsOspjmavcEYZ58MfbV8/I6Jn+bzFfS+lLasUwknck+LDDUEWl9oFEZM
	 xDU0tV/wPlolLIKfvmqbZsQyzkVbRqrc5gR5zZmNp7DLskxzLSHQnWTZef+qB8QAGw
	 DKUoAqFmSwFPVsH18e025NPl++Z50ZoZFHFKgnzc=
Date: Thu, 22 Dec 2022 07:07:54 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joe Wu <joewu@msi.corp-partner.google.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Furquan Shaikh <furquan@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Derek Huang <derekhuang@google.com>,
	"Dustin L . Howett" <dustin@howett.net>, Joe Wu <joewu@msi.com>,
	Guenter Roeck <groeck@chromium.org>, linux-input@vger.kernel.org,
	Xiang wangx <wangxiang@cdjrlc.com>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Prashant Malani <pmalani@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	Stephen Boyd <swboyd@chromium.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH] cros_ec_keyb: Add 3 buttons for monitor function
Message-ID: <Y6P0Ogh1T6n5i3Bi@kroah.com>
References: <20221222021542.11706-1-joewu@msi.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221222021542.11706-1-joewu@msi.corp-partner.google.com>

On Thu, Dec 22, 2022 at 10:15:42AM +0800, Joe Wu wrote:
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -3471,6 +3471,9 @@ struct ec_response_get_next_event_v1 {
>  #define EC_MKBP_VOL_UP		1
>  #define EC_MKBP_VOL_DOWN	2
>  #define EC_MKBP_RECOVERY	3
> +#define EC_MKBP_BRI_UP          4
> +#define EC_MKBP_BRI_DOWN        5
> +#define EC_MKBP_SCREEN_LOCK     6

You forgot to use tabs :(

