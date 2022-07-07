Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D41F2CA5
	for <chrome-platform@lists.linux.dev>; Thu,  7 Jul 2022 22:06:34 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id r3so34894258ybr.6
        for <chrome-platform@lists.linux.dev>; Thu, 07 Jul 2022 15:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7UFGapQUmVzze+bPOzX448q4o7gbh7fA6vE58zBhvvM=;
        b=ZP8qKMGpzxTcxHpyX+YtpLCre0I0SLiX8dNkR8f1hwUFCt8K0TvDtqClFnq/w5L0y9
         cOcFu5jmvSQaMMLyPQMZEZytUZO4bCtIFApl70ZnFq5Db+3RXsPhWy0AoUmubKqhZ4So
         bw1yhLs9WWrUn7z2sQ9FUW77rqTD7DgTUYGfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7UFGapQUmVzze+bPOzX448q4o7gbh7fA6vE58zBhvvM=;
        b=WclryF/iEtEdvhsyUzUqfCiRr8uCSUZCgi6ZZ7pjMlkKxnihIyggRgnDxW9OCcIUvb
         DujGxmJVLqSEBuKzouT2c+8UVuzyUkjSBCw+Dpl1KWTobYNb1SJvsHwpRi03pnogtzGz
         Qg+tPKTGQVsH8zWDSmHwHAZUzJB8219E9FbrafUiqGPoi2qrwIeh+2dXjnxUkEK53msd
         DI+9ycpunmwyqrygV2rPjcdjuWWIzLTwy74jarYm5BqnBxtumhclKQONzT9MTWKZjL9N
         D1q0PqotuiCBIApcrsgo7BbP7MKqoyKVih6d+jXA1jtEVxGfAHFdTiYBew4V4VukdpMe
         FfKg==
X-Gm-Message-State: AJIora+Yqhw/+Le9dJG6UrWIbGAN4QTlxQ2uAoGFmz7p1L921v24qyLK
	WB+fG4Vnlirv9r8+bwSJTf1dkjf0IhBfLjEi2z8ztg==
X-Google-Smtp-Source: AGRyM1tA88lK8bMldivq5Q8tXTohFQGXUUrPduGItjYoy9GpwYyOXFyU3HX0TeVAhcOPU/AITKKPXUEpF+NN+gSsVRg=
X-Received: by 2002:a25:b7cf:0:b0:66e:2ddc:dda7 with SMTP id
 u15-20020a25b7cf000000b0066e2ddcdda7mr88408ybj.197.1657231593901; Thu, 07 Jul
 2022 15:06:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220706171601.807042-7-pmalani@chromium.org> <202207071256.63ElDHIG-lkp@intel.com>
In-Reply-To: <202207071256.63ElDHIG-lkp@intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 7 Jul 2022 15:06:23 -0700
Message-ID: <CACeCKadwM7VVZadZxDr-TQ0DB1Dy5mv2bwY=p+p3Y1uVNHE8Tg@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] platform/chrome: cros_typec_switch: Add event check
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, kbuild-all@lists.01.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, Daisuke Nojiri <dnojiri@chromium.org>, 
	"Dustin L. Howett" <dustin@howett.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guenter Roeck <groeck@chromium.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Tzung-Bi Shih <tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 6, 2022 at 9:26 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Prashant,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on usb/usb-testing]
> [cannot apply to chrome-platform/for-next linus/master balbi-usb/testing/next peter-chen-usb/for-usb-next v5.19-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Prashant-Malani/platform-chrome-Type-C-switch-driver-and-Type-C-framework-updates/20220707-012614
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220707/202207071256.63ElDHIG-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/intel-lab-lkp/linux/commit/60e03c1b36c0e3533e481b44152faab38448be5b
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Prashant-Malani/platform-chrome-Type-C-switch-driver-and-Type-C-framework-updates/20220707-012614
>         git checkout 60e03c1b36c0e3533e481b44152faab38448be5b
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/chrome/ kernel/bpf/
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/platform/chrome/cros_typec_switch.c:81:6: warning: no previous prototype for 'cros_typec_check_event' [-Wmissing-prototypes]
>       81 | bool cros_typec_check_event(struct cros_typec_switch_data *sdata, int port_num, u32 mask)
>          |      ^~~~~~~~~~~~~~~~~~~~~~
>    drivers/platform/chrome/cros_typec_switch.c:159:6: warning: no previous prototype for 'cros_typec_unregister_switches' [-Wmissing-prototypes]
>      159 | void cros_typec_unregister_switches(struct cros_typec_switch_data *sdata)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/platform/chrome/cros_typec_switch.c:170:5: warning: no previous prototype for 'cros_typec_register_retimer' [-Wmissing-prototypes]
>      170 | int cros_typec_register_retimer(struct cros_typec_port *port, struct fwnode_handle *fwnode)
>          |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
I'll fix these warnings and send out a v3.
Apologies for the churn.

-Prashant
